#!/bin/bash

date=$1

function absent {
    final="$name $date"
    found=$(strings attendance.log | grep "$final")
    if ! [[ $found != "" ]]
    then
        echo $name is absent on $date
    fi
}

function getUser {
    for i in {01..30}
    do
        name="$1_$i -"
        absent
    done
}

getUser sysAd
getUser webDev
getUser appDev