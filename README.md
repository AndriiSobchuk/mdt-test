<h1>WEEK 1. Task report </h1>
<p> Task 1) Spin up a VM.</p>
<p> VM had been setup on GCP (folder SCREENS_SCRIPTS contains screenshot) </p>
<p> Task 2) Install Nginx web server and git </p>
<p> HERE IS INTALLATION SCRIPT FOR TASK #2 (folder SCREENS_SCRIPTS contains  .sh file)</p>


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

<p> Task 3) Fork GitHub repo </p>
<p> The repo given in the task had been forked to my GitHub (folder SCREENS_SCRIPTS contains screenshot) </p>

<p> Task 4) Setup a cron job for a regular (every 1 min) checkout from main branch </p>
<p> To this task I create a script and put it on cron jobs </p>

      #!/bin/bash
      #!/usr/bin/env bash

      cd $HOME/material-design-template && /usr/bin/git pull origin master
      echo $(date) " pull is successful" >> $HOME/material-design-template/pull_mdt.txt 

<p> Screen with crontab settings and results you can find in folder SCREENS_SCRIPTS or you can find it here:  material-design-template/pull_mdt.txt </p>

<p> Task 5) Update index.html from your machine, push changes to Git and confirm updated content on web page </p>
<p> I used to change the configuration of file /etc/nginx/sites-enabled/default </p>
<p> The default parameter root /var/www/html had been changed to /home/andrii/material-design-template/www/ and in index.html I made: 1) a change MD Template -> Andrii Sobchuk Template 2) restart Nginx (sudo systemctl restart nginx) (folder SCREENS_SCRIPTS contains screenshot / or you can check the Public IP address: http://35.222.234.112/); after all the changes had been commited and pushed into GitHub repository </p>

<p> Task 6) Configure GitHub hook instead of cron (use a local git hooks for validation of incoming commits) and reject commits if the word from the blacklist hab been find  </p>
<p> I create a file with execution permissions at my local repo $REPO_PATH/.git/hooks -> file .sh named pre-commit that search for blacklisted word to block commit in case of policy compliance. The script has a following code: </p>

    #!/bin/bash

    #!/usr/bin/env bash
    #set -x
    #check if restricted words exit somewhere in the code AND reject the commit if it is!!!

    if [[ $(grep -rnw --exclude-dir={hooks,SCREENS_SCRIPTS} --exclude=README.md /home/andrii/material-design-template/ -e shit) ]]; then

    #FAIL SCENARIO

	echo "BLOCKED BY pre-commit policy! Check your code again!!!!!
	echo $(date) the commit had been blocked by policy reason >> failed-commits-log.txt
	exit 1
     else 
          #SUCCESS SCENARIO

	echo "Success. Commit is done!"
	echo $(date) the commit had been successful >> success-commits-log.txt
        exit 0
     fi




<h2>License</h2>
Material Design One Page HTML Template is licensed under the <a href="http://sam.zoy.org/wtfpl/">WTFPL license</a>.
