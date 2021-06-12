#!/bin/bash

#./attendance.sh > ut.txt

date="2019-12-25"
string="sysAd_21 -"
final="$string $date"
found=$(strings attendance.log | grep "$final")
if [[ $found != "" ]]
then
    echo "found"
else
    echo "not found"
fi