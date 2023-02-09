#set -xv 
###############################################################
#
#TITLE:               SCRIPT ARGUMENTS  
#
#JOB:           deploy  
#
#DESC:          Script de déploiement automatique de conteneurs DOCKER
#
###########################################################################
#AUT:           Author      : Eric.M
###########################################################################
#VERS:		    version : 1.1
###########################################################################
#DATE:			DATE: 01/10/2022
###########################################################################

case "$1" in
"--create")
echo ""
	echo " notre option est $1"
	echo ""

	#choix nombre de conteneur
	nombre_machine=1
	[ "$2" != "" ] && nombre_machine=$2

	#creation conteneur
	for i in $(seq 1 $nombre_machine);do
		docker run -tid --name $USER-tomcat-$i tomcat:latest
	done
	echo "${nombre_machine} machine(s) crée(s)"
	echo "$USER-tomcat-$i crée(s)"
;;
"--drop")
echo ""
	echo " suppression du/des conteneur(s)"
echo ""
	docker rm -f $(docker ps -a | grep $USER-tomcat |awk '{print $1}')

;;
"--start")
echo ""
	echo " notre option est $1"
;;
"--ansible")
echo ""
	echo " notre option est $1"
;;
"--infos")
echo ""
	echo " notre option est $1"
;;
*)
echo "

    Vous devez indiquer une Option :
     		- --create : lancer des conteneurs
     
     		- --drop : supprimer les conteneurs créer par le deploy.sh
     	
     		- --infos : caractéristiques des conteneurs (ip, nom, user...)
     
     		- --start : redémarrage des conteneurs
     
     		- --ansible : déploiement arborescence ansible"
;;
esac


