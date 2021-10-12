#!/bin/bash
#!/usr/bin/env bash

#set -x

######################## GIT INSTALLATION SECTION ##################
sudo apt install git -y

# if necessary -> update Git to latest version
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
#sudo apt upgrade -y
sudo apt apt install git -y

git config --global user.name "Andrii Sobchuk"
git config --global user.email "anri.sobchuk@gmail.com"

####################################################################

echo "The local version of git is:" ; git --version

################### NGINX SECTION ##################################


sudo apt update 
sudo apt install nginx -y

PATH=/usr/sbin/:$PATH

echo "The local nginx version is: "
nginx -v 

### check if NGINX is running ###

if [ -e /var/run/nginx.pid ]
then
     echo "NGINX is running"
else
	echo "Something went wrong with NGINX Server..."
	sudo systemctl restart nginx
        if [ -e /var/run/nginx.pid ]
	then
		echo "Please, find a problem with NGINX Server to continue setup scenario!!!!!!"
		exit 1
	fi

fi


################## GIT CLONE PROJECT REPOSITORY ####################

# in case our ssh-key is ready to use by GitHub
cd ~
git clone git@github.com:AndriiSobchuk/material-design-template.git


##### CHECKING THE STATUS ##############
# uncomment if necessary 
git --version
nginx -v 
sudo systemctl status nginx
ls ~/material-design-template

