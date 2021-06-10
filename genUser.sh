#!/bin/bash

function printDomain(){
    for ((i=01;i<=10;i++))
do
    printf "$1_%02d\n" $i
done
}

printDomain sysAd
printDomain appDev
printDomain webDev

genUser 