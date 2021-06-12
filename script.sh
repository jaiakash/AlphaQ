#!/bin/bash

#function to create users and add to domain gorup
function genUser{
    for i in {01..30}
    do
        sudo adduser $1_$i $1
        #adduser automatically creates home directory
        #unlike useradd
    done
}

#function to copy schedule file to each user's directory
function schedule{
    for i in {01..30}
    do
        #dt="2021-07-14"
        dt=$( date +%F )
        #using strings and grep to get th schedule of current day
        strings future.txt | grep  $dt | tee ./sdl.txt
        cp sdl.txt /home/$1_$i/schedule.txt
    done
}

#function to copy schedule file to each user's directory
function permit{
    for i in {01..30}
    do
        #Adding to group
        if [ $i -le 11 ]
        then
            sudo adduser $1_$i secondyr
        elif [ $i -le 21 ]
        then
            sudo adduser $1_$i thirdyr
        elif [ $i -le 31 ]
        then
            sudo adduser $1_$i fourthyr
        fi
    done
}

#Creating User Group

newgrp alpha
newgrp sysad
newgrp appdev
negrp webdev

#Adding Jay_Jay and users of 3 domains
sudo adduser jay_jay alpha
genUser sysad
genUser appdev
genUser webdev

#Permission group
newgrp head
newgrp fourthyr
newgrp thirdyr
negrp secondyr

#Permission
sudo adduser jay_jay head
permit sysad
permit appdev
permit webdev

#Shedule
cp future.txt /home/jay_jay/schedule.txt
schedule sysad
schedule appdev
schedule webdev