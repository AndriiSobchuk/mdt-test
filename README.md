<h1>WEEK 1. Task report </h1>
<p> Task 1) Spin up a VM.</p>
<p> VM had been setup on GCP (folder SCREENS_SCRIPTS contains screenshot) </p>
<p> Task 2) Install Nginx web server and git </p>
<p> HERE IS INTALLATION SCRIPT FOR TASK #2 (folder SCREENS_SCRIPTS contains  .sh file)</p>
##

#!/bin/bash

#!/usr/bin/env bash

#set -x

######################## GIT INSTALLATION SECTION ##################

sudo apt install git -y

######## if necessary -> update Git to latest version

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

######## check if NGINX is running ###

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

######## in case our ssh-key is ready to use by GitHub

cd ~

git clone git@github.com:AndriiSobchuk/material-design-template.git


######## CHECKING THE STATUS ##############
######## uncomment if necessaty 

git --version

nginx -v 

sudo systemctl status nginx

ls ~/material-design-template

<p> VM had been setup on GCP (folder SCREENS_SCRIPTS contain screenshot) </p>
<p>MD One page template is fully responsive and free to use. This HTML template is based on <a href="http://materializecss.com/">Materialize</a>, a CSS Framework based on Material Design.</p>
<a href="http://joashpereira.com/templates/material_one_pager/">View Demo</a>
<br/>
<h3>Screenshots</h3>
<img src="https://m1.behance.net/rendition/modules/155787441/disp/f7713eb665752f2da380ec8f7a3cdcae.png" height="300px"/> <img src="https://m1.behance.net/rendition/modules/155787447/disp/e546efd70f5b46e45829e0da79375243.png" height="300px"/>
<br/>
<a href="https://www.behance.net/gallery/23484793/Material-Design-One-Page-Template">View More Screens</a>
<h3>Platforms used</h3>
HTML, CSS, JS

<h3>Resources</h3>
<ul>
    <li><a href="http://materializecss.com/">Materialize</a></li>
    <li><a href="http://www.materialpalette.com/">Material Design Colors</a></li>
</ul>

<h2>License</h2>
Material Design One Page HTML Template is licensed under the <a href="http://sam.zoy.org/wtfpl/">WTFPL license</a>.
