Formation en autodidacte: Gestion automatisée de conteneurs docker

Prérequis:
-Un laptop avec minimum 8Go de RAM

-Connaitre les commandes de navigation basiques sur linux

-Une vue globale de ce que sont VAGRANT,DOCKER et ANSIBLE

STEPS:

1 --> Création node linux : Infrastrure As Code 

On utilisera vagrant( je te laisse te renseigner sur la toile pour en savoir plus sur vagrant) :

le vagrantfile contient un fichier Install_docker.sh qui permet d'installer docker et git et sera exécuté à la création du node

2 --> Gestion conteneur Docker 

Le script deploy.sh permet d'automatiser la gestion des conteneurs(création, suppression, démarrage, monitoring,...)


Cette automaformation est inspirée des blogs: https://xavki.blog/ & https://www.christophe-casalegno.com/ qui propose des contenus français que je trouve intéressant.
 
