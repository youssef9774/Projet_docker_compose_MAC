# Projet_docker_compose_MAC

## Objectif du projet

Creation une infrastructure composée de trois parties un serveur , un firewall et un client . ils sont situés dans un container Docker. nous avons utilisé Docker compose pour faciliter la communication entre les Trois. 




## Etape 1 : Installation de Docker sur MAC
A partir de site officiel , on peut telecharger docker compatible sur MAC`
Lien de téléchargement : https://docs.docker.com/desktop/mac/install/
![DOCKER DESKTOP](pictures/1.png)

Logiciel bien installer sur mac
![DOCKER DESKTOP](pictures/2.png)

## Etape 2 : Configuration de Docker sur MAC

![DOCKER DESKTOP](pictures/3.png)
Le projet Getting Started est un simple dépôt GitHub qui contient tout ce dont vous avez besoin pour construire une image et l'exécuter en tant que conteneur.


### Clone le référentiel en exécutant Git dans un conteneur.
![DOCKER DESKTOP](pictures/4.png)

### Build

Maintenant, on va construire  l'image
Une image Docker est un système de fichiers privé réservé à notre conteneur. Elle permet de fournir tous les fichiers et le code dont notre conteneur a besoin.

![DOCKER DESKTOP](pictures/5.png)

### execution 
On va Exécuter notre premier conteneur : nous allons Démarrer un conteneur basé sur l'image que nous avons construite à l'étape précédente. L'exécution d'un conteneur lance notre application avec des ressources privées, isolées en toute sécurité du reste de votre machine.

![DOCKER DESKTOP](pictures/5.png)

## Infrastructure demandée pour le projet 

![DOCKER DESKTOP](pictures/6.png)
![DOCKER DESKTOP](pictures/7.png)

### Partie client
![DOCKER DESKTOP](pictures/8.png)

### Partie serveur
![DOCKER DESKTOP](pictures/9.png)

### Partie firewall
![DOCKER DESKTOP](pictures/10.png)

### Un fichier docker-compose.yml 
![DOCKER DESKTOP](pictures/11.png)

## Contenue des fichiers utiliser pour le projet 

Partie Client
Fichier client.py

![DOCKER DESKTOP](pictures/12.png)

Fichier Dockerfile :
![DOCKER DESKTOP](pictures/13.png)

Partie serveur :
Fichier serveur.py
![DOCKER DESKTOP](pictures/14.png)

Fichier Dockerfile : 
![DOCKER DESKTOP](pictures/15.png)

Index.html : 

![DOCKER DESKTOP](pictures/16.png)

Partie Firewall : 

Fichier clean.sh :
![DOCKER DESKTOP](pictures/17.png)

Fichier firewall.sh

![DOCKER DESKTOP](pictures/18.png)

Dockerfile :
![DOCKER DESKTOP](pictures/19.png)

Fichier docker-compose.yml 
![DOCKER DESKTOP](pictures/20.png)

## Lancement de projet sur docker 

Il faut utiliser la commande : 
`docker-compose build `


but : creation des images à partir de fichier docker-compose.yml et dockerfile pour le client et serveur pour chaqu’un.
![DOCKER DESKTOP](pictures/21.png)


Avec la commade `docker images` : 
But : afficher tous les images ont été créés 

![DOCKER DESKTOP](pictures/22.png)

Sinon on peut trouver les images créer dans l’application docker Desktop on cliquant sur image

![DOCKER DESKTOP](pictures/23.png)


Avec la commade : `docker-compose up` 
But : pour lancer les contenaires client serveur , firewall

![DOCKER DESKTOP](pictures/24.png)
![DOCKER DESKTOP](pictures/25.png)

A partir de docker desktop on peut trouver les containers lancés (in use)

![DOCKER DESKTOP](pictures/26.png)
Avec la commande : `Docker container ls`  

But : afficher la liste de container. ( avec l’id de container ) 
![DOCKER DESKTOP](pictures/27.png)

![DOCKER DESKTOP](pictures/28.png)

Avec la commande : `docker exec -it 332eeea56f4e /bin/bash`  

### Remarque : 332eeea56f4e c’est l’id de client 
Pour acceder au client 

On a utiliser sur script client.py pour communiquer avec le serveur 

![DOCKER DESKTOP](pictures/29.png)

Avec la commande : `docker exec -it 9da3816e32df /bin/bash`  

### Remarque : 9da3816e32df c’est l’id de firewall 
Pour acceder au container de Firewall on utilisant l’id de firewall avec la commande iptables – L pour afficher la liste des regles.

![DOCKER DESKTOP](pictures/30.png)

Avec la commande `curl 172.17.0.1 :8080`  on peut lancer aussi le site web ( serveur ) 
![DOCKER DESKTOP](pictures/31.png)
![DOCKER DESKTOP](pictures/32.png)

Le firewall autorise une règle sur le port 172.18.0.1 
Et il refuse d’autre adresse ip  dans le but de filtrage des adresses ip .

![DOCKER DESKTOP](pictures/33.png)




