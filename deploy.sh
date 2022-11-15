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
;;
"--drop")
echo ""
	echo " notre option est $1"
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


