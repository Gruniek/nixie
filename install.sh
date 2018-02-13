#!/bin/bash

echo "###########################";
echo " #   #  #  #   #  #  ####";
echo " ##  #      # #      #";
echo " # # #  #    #    #  ####";
echo " #  ##  #   # #   #  #";
echo " #   #  #  #   #  #  ####";
echo " ##########################";
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
echo "[NIXIE]" >> conf.ini

echo "Server name/id";
read keyboard
echo "server_id=$keyboard" >> conf.ini

echo " ";
echo "SQL User  : ";
read keyboard
echo "sql_user=$keyboard" >> conf.ini
echo " ";
echo "SQL Pass  : ";
read keyboard
echo "sql_pass=$keyboard" >> conf.ini
echo " ";
echo "SQL Host  : ";
read keyboard
echo "sql_host=$keyboard" >> conf.ini
echo " ";
echo "SQL table : ";
read keyboard
echo "sql_table=$keyboard" >> conf.ini
echo " ";
echo "Refresh data logger / sec : ";
read keyboard
echo "refresh_data=$keyboard" >> conf.ini
echo " ";
echo " ";
while true; do
    read -p "Enable the the data logger ? : " yn
    case $yn in
        [Yy]* ) echo "logger_enable=True"; break;;
        [Nn]* ) echo "logger_enable=False"; break;;
        * ) echo "Please answer yes or no.";;
esac

