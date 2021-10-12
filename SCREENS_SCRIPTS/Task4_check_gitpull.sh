#!/bin/bash
#!/usr/bin/env bash

cd $HOME/material-design-template && /usr/bin/git pull origin master
echo $(date) " pull is successful" >> $HOME/material-design-template/pull_mdt.txt 

