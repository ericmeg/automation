#!/bin/bash

function usage() {
  echo "Utilisation: $0 [options]"
  echo ""
  echo "Options:"
  echo "--create <nombre>              Créer le nombre spécifié de conteneurs Docker Tomcat avec un nom unique pour chacun."
  echo "--execute <nombre>             Exécuter le nombre spécifié de conteneurs Docker Tomcat avec un nom unique pour chacun."
  echo "--drop <nom> [nom ...]         Supprimer un ou plusieurs conteneurs Docker à partir de leur nom."
  echo "--start <nom> [nom ...]        Démarrer un ou plusieurs conteneurs Docker à partir de leur nom."
  echo "--infos                        Afficher les informations sur les options disponibles."
  exit 1
}

function check_docker_status() {
  if ! command -v docker &> /dev/null
  then
      echo "Docker n'est pas installé sur ce système."
      exit 1
  else
      echo "Docker est installé."
  fi
}

function create_docker_containers() {
  local num_containers="$1"
  if [ -z "$num_containers" ]; then
    echo "Le nombre de conteneurs doit être spécifié."
    usage
  fi
  for i in $(seq 1 $num_containers)
  do
        docker run -tid --name $USER-tomcat-$i -p "808$i:8080" tomcat:latest
        
        echo "${num_containers} machine(s) crée(s)"
        echo "$USER-tomcat-$i crée(s)"
     
  done
}

function execute_docker_containers() {
        #choix numero de conteneur
        numero_machine=1
        [ "$2" != "" ] && numero_machine=$2

        #creation conteneur
        for i in $(seq 1 $numero_machine);do
                docker exec -ti $(docker ps -a | grep $USER-tomcat-$i |awk '{print $1}') bash
        done
        echo "${numero_machine} machine(s) exécutée(s)"
        echo "$USER-tomcat-$i running"
}


function drop_docker_containers() {
  if [ "$#" -eq 0 ]; then
    echo "Au moins un nom de conteneur doit être spécifié."
    usage
  fi
  for name in "$@"
  do
    docker rm -f "$name"
  done
}

function start_docker_containers() {
  if [ "$#" -eq 0 ]; then
    echo "Au moins un nom de conteneur doit être spécifié."
    usage
  fi
  for name in "$@"
  do
    docker start "$name"
  done
}

function show_info() {
  echo "Options disponibles:"
  echo "--create <nombre>          Créer le nombre spécifié de conteneurs Docker Tomcat avec un nom unique pour chacun."
  echo "--drop <nom> [nom ...]     Supprimer un ou plusieurs conteneurs Docker à partir de leur nom."
  echo "--start <nom> [nom ...]    Démarrer un ou plusieurs conteneurs Docker à partir de leur nom."
  echo "--execute <nombre>         Exécute le nombre spécifié de conteneurs Docker Tomcat à partir de leur nom spécifique."
  echo "--infos                    Afficher les informations sur les options disponibles."
  exit 1
}

check_docker_status

if [ "$#" -eq 0 ]; then
  usage
fi

while [ "$#" -gt 0 ]
do
  case "$1" in
    --create)
      shift
      create_docker_containers "$1"
      ;;
    --drop)
      shift
      drop_docker_containers "$@"
      ;;
    --start)
      shift
      start_docker_containers "$@"
      ;;
    --execute)
      execute_docker_containers "$2"
      ;;
    --infos)
      show_info
      ;;
    *)
      usage
      ;;
  esac
  shift
done

