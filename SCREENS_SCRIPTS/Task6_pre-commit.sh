#!/bin/bash
#!/usr/bin/env bash

#set -x

#check if restricted words exit somewhere in the code AND reject the commit if it is!!!

#################################################### 

if [[ $(grep -rnw --exclude-dir=hooks --exclude=README.md /home/andrii/material-design-template/ -e shit) ]]; then
#FAIL SCENARIO
        echo "BLOCKED BY pre-commit policy! Check your code again!!!!!"
        echo $(date) the commit had been blocked by policy reason >> failed-commits-log.txt
        exit 1
else 
#SUCCESS SCENARIO
        echo "Success. Commit is done!"
        echo $(date) the commit had been successful >> success-commits-log.txt
        exit 0
fi



