#!/bin/bash

#function to create users
function genUser(){
    mkdir $1
    for i in {01..30}
    do
        sudo adduser $1_$i
        cd ./$1
        mkdir $1_$i
        cd ..
    done
}

#Creating User Group
newgrp head
newgrp fourthyr
newgrp thirdyr
negrp secondyr

#Adding Jay_Jay and users of 3 domains
sudo adduser jay_jay
genUser sysad
genUser appdev
genUser webdev

#Creating Home directory


#Shedule