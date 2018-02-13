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
dir_now=`pwd`;
cd /tmp 
wget https://raw.githubusercontent.com/Gruniek/nixie/master/version.txt
version=`cat /tmp/version.txt`;
rm /tmp/version.txt
wget https://raw.githubusercontent.com/Gruniek/nixie/master/$version/installer.sh
chmod 777 installer.sh
./installer.sh
rm -rf /tmp/installer.sh
rm -rf /tmp/version.txt
cd $dir_now;




