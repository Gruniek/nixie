#!/bin/bash

version="0.1";

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
wget https://raw.githubusercontent.com/Gruniek/nixie/master/0.1/nixie.sh
wget https://raw.githubusercontent.com/Gruniek/nixie/master/0.1/deamon.sh
wget https://raw.githubusercontent.com/Gruniek/nixie/master/0.1/get_data.sh

echo "Configuration file";
echo "[NIXIE]" >> $config_file

echo "Server name/id";
read server_id
echo "server_id=$server_id" >> $config_file
echo " ";
echo "SQL User  : ";
read sql_user
echo "sql_user=$sql_user" >> $config_file
echo " ";
echo "SQL Pass  : ";
read sql_pass
echo "sql_pass=$sql_pass" >> $config_file
echo " ";
echo "SQL Host  : ";
read sql_host
echo "sql_host=$sql_host" >> $config_file
echo " ";
echo "SQL table : ";
read sql_table
echo "sql_table=$sql_table" >> $config_file
echo " ";

echo "Testing the SQL connection and if the table exist...";

#RESULT=`mysqlshow --user=$sql_user --password=$sql_pass $sql_table --host=$sql_host| grep -v server | grep -o $sql_table`
#if [ "$RESULT" == "myDatabase" ]; then
#    echo YES
#fi
#else if


echo "Refresh data logger / sec : ";
read update_logger
echo "refresh_data=$update_logger" >> $config_file
echo " ";
echo "Update Nixie software/min : ";
read update_nixie
echo "refresh_data=$update_nixie" >> $config_file
echo " ";
echo " ";



echo " " >> $config_file
echo "[Monitoring]" >> $config_file
echo "cpu=True" >> $config_file
echo "mem=True" >> $config_file
echo "hdd=True" >> $config_file
echo "eth=False" >> $config_file
echo "user=False" >> $config_file
