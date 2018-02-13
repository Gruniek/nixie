#!/bin/bash

echo "##########################";
echo " #   #  #  #   #  #  ####";
echo " ##  #      # #      #";
echo " # # #  #    #    #  ####";
echo " #  ##  #   # #   #  #";
echo " #   #  #  #   #  #  ####";
echo "##########################";
echo " ";

config_file="configuration.ini";

cd /tmp 
wget https://raw.githubusercontent.com/Gruniek/nixie/master/version.txt
version=`cat /tmp/version.txt`;
rm /tmp/version.txt
wget https://raw.githubusercontent.com/Gruniek/nixie/master/$version/installer.sh
chmod 777 installer.sh
./installer.sh



