#!/bin/bash

<<<<<<< HEAD
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
=======
#function to create users and add to domain gorup
function genUser{
    for i in {01..30}
    do
        sudo adduser $1_$i $1
        #adduser automatically creates home directory
        #unlike useradd
>>>>>>> 96fdc5d... Added permit fucntion (persmission command left)
    done
}

#function to copy schedule file to each user's directory
function schedule{
    for i in {01..30}
    do
        cp future.txt /home/$1_$i/schedule.txt
    done
}

<<<<<<< HEAD
#Creating User Group
newgrp head
newgrp fourthyr
newgrp thirdyr
negrp secondyr

#Adding Jay_Jay and users of 3 domains
sudo adduser jay_jay
=======
#function to copy schedule file to each user's directory
# function permit{
#     for i in {01..30}
#     do

#         #Adding to group
#         if [ $i -le 11 ]
#         then
#             sudo adduser $1_$i secondyr
#         elif [ $i -le 21 ]
#         then
#             sudo adduser $1_$i thirdyr
#         elif [ $i -le 31 ]
#         then
#             sudo adduser $1_$i fourthyr
#         fi
#     done
# }

#Creating User Group

newgrp alpha
newgrp sysad
newgrp appdev
negrp webdev

#Adding Jay_Jay and users of 3 domains
sudo adduser jay_jay alpha
>>>>>>> 96fdc5d... Added permit fucntion (persmission command left)
genUser sysad
genUser appdev
genUser webdev

<<<<<<< HEAD
#adding users to group
# Done in genUser fucntion
sudo adduser jay_jay head
=======
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
>>>>>>> 96fdc5d... Added permit fucntion (persmission command left)

#Shedule
cp future.txt /home/jay_jay/schedule.txt
schedule sysad
schedule appdev
schedule webdev