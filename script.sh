#!/bin/bash

#function to create users
function genUser{
    for i in {01..30}
    do
        sudo adduser $1_$i
        #adduser automatically creates home directory
        #unlike useradd

        #Adding to group
        if [$i -gl 11]
        then
            sudo adduser $1_$i secondyr
        elif [$i -gl 21]
        then
            sudo adduser $1_$i thirdyr
        elif [$i -gl 31]
        then
            sudo adduser $1_$i fourthyr
        fi
    done
}

#function to copy schedule file to each user's directory
function schedule{
    for i in {01..30}
    do
        cp future.txt /home/$1_$i/schedule.txt
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

#adding users to group
# Done in genUser fucntion
sudo adduser jay_jay head

#Shedule
cp future.txt /home/jay_jay/schedule.txt
schedule sysad
schedule appdev
schedule webdev