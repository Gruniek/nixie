#!/bin/bash

echo "###########################";
echo " #   #  #  #   #  #  ####";
echo " ##  #      # #      #";
echo " # # #  #    #    #  ####";
echo " #  ##  #   # #   #  #";
echo " #   #  #  #   #  #  ####";
echo " ##########################";
echo " ";

config_file="config.ini";

FILE="/tmp/out.$$"
GREP="/bin/grep"
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


FILE=/opt/nixie/nixie.sh     
if [ -f $FILE ]; then
   echo "Nixieare already installed.";
   echo "For a complete reinstallation : Please remove the "/opt/nixie" directory.";
   exit 1
else
   while true; do
    read -p "Do you wish to install Nixe? : " yn
    case $yn in
        [Yy]* ) echo " "; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
fi

# CHECH IF MYSQL EXIST
echo "Checking if mysql client are installed...";

if hash mysql 2>/dev/null; then
        echo "mysql-client found";
else
        echo "mysql-client not found";
        apt-get update
        apt-get -y install mysql-client
        echo "done."
fi

echo "Installing Nixie into /opt/nixie";
mkdir /opt/nixie
cd /opt/nixie
wget https://raw.githubusercontent.com/Gruniek/nixie/master/nixie.sh
wget https://raw.githubusercontent.com/Gruniek/nixie/master/deamon.sh
wget https://raw.githubusercontent.com/Gruniek/nixie/master/get_data.sh

echo "Configuration file";
echo "[NIXIE]" >> $config_file

echo "Server name/id";
read -p keyboard
echo "server_id=$keyboard" >> $config_file
echo " ";
echo "SQL User  : ";
read -p keyboard
echo "sql_user=$keyboard" >> $config_file
echo " ";
echo "SQL Pass  : ";
read -p keyboard
echo "sql_pass=$keyboard" >> $config_file
echo " ";
echo "SQL Host  : ";
read -p keyboard
echo "sql_host=$keyboard" >> $config_file
echo " ";
echo "SQL table : ";
read -p keyboard
echo "sql_table=$keyboard" >> $config_file
echo " ";
echo "Refresh data logger / sec : ";
read -p keyboard
echo "refresh_data=$keyboard" >> $config_file
echo " ";
echo "Update er / sec : ";
read -p keyboard
echo "refresh_data=$keyboard" >> $config_file
echo " ";
echo " ";



echo " " >> $config_file
echo "[Monitoring]" >> $config_file
echo "cpu=True" >> $config_file
echo "mem=True" >> $config_file
echo "hdd=True" >> $config_file
echo "eth=False" >> $config_file
echo "user=False" >> $config_file

