#!/bin/bash

echo " ";
echo ".__   __.  __  ___   ___  __   _______ ";
echo "|  \ |  | |  | \  \ /  / |  | |   ____|";
echo "|   \|  | |  |  \  V  /  |  | |  |__   ";
echo "|  .    | |  |   >   <   |  | |   __|  ";
echo "|  |\   | |  |  /  .  \  |  | |  |____ ";
echo "|__| \__| |__| /__/ \__\ |__| |_______|";
echo " ";                              



FILE="/tmp/out.$$"
GREP="/bin/grep"
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


FILE=/opt/nixie/nixie.sh     
if [ -f $FILE ]; then
   echo "Nixieare already installed."
   exit 1
else
   while true; do
    read -p "Do you wish to install Nixe?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
fi
