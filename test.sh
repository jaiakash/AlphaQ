#!/bin/bash

dt=$( date +%F )
#dt="2021-07-14"
strings future.txt | grep  $dt | tee ./ot.txt