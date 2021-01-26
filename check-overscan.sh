#!/bin/sh

configFile="/boot/firmware/config.txt"

if [ ! $(awk '/disable_overscan=1/ { print("1") }' $configFile) ]; then
    echo "disable_overscan=1" >> $configFile;
fi;