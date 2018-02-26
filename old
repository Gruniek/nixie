#!/bin/bash

#CONFIG
#=======#
#ID SERVER
server_id=$(awk -F "=" '/server_name/ {print $2}' conf.ini);

#MYSQL
sql_user=$(awk -F "=" '/sql_user/ {print $2}' conf.ini);
sql_pass=$(awk -F "=" '/sql_pass/ {print $2}' conf.ini);
sql_host=$(awk -F "=" '/sql_host/ {print $2}' conf.ini);
sql_table=$(awk -F "=" '/sql_table/ {print $2}' conf.ini);

#UPDATE SERVER
update_delay=$(awk -F "=" '/update_delay/ {print $2}' conf.ini);



mem_total=`cat /proc/meminfo | grep -ohe 'MemTotal[s:][: ].*' | awk '{ print $2 }'`;
nb_cpu=`grep processor /proc/cpuinfo | wc -l`;




while true; do
	sleep $update_delay;

	unix_time=`date +'%s'`;

	#CPU
	###################################
	load=`uptime | grep -ohe 'load average[s:][: ].*' | awk '{ print $3 }'`;
	load=${load:0:-1};
	cpu_pc=`grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_0=`grep 'cpu0 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_1=`grep 'cpu1 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_2=`grep 'cpu2 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_3=`grep 'cpu3 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_4=`grep 'cpu4 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_5=`grep 'cpu5 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_6=`grep 'cpu6 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_7=`grep 'cpu7 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_8=`grep 'cpu8 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_9=`grep 'cpu9 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_10=`grep 'cpu10 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_11=`grep 'cpu11 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_12=`grep 'cpu12 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_13=`grep 'cpu13 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_14=`grep 'cpu14 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	cpu_pc_15=`grep 'cpu15 ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}'`;
	
	echo "INSERT INTO cpu (id,date,load_av,cpu,cpu_0,cpu_1,cpu_2,cpu_3,cpu_4,cpu_5,cpu_6,cpu_7,cpu_8,cpu_9,cpu_10,cpu_11,cpu_12,cpu_13,cpu_14,cpu_15) VALUES  ('$server_id', '$unix_time', '$load','$cpu_pc','$cpu_pc_0', '$cpu_pc_1', '$cpu_pc_2', '$cpu_pc_3', '$cpu_pc_4', '$cpu_pc_5', '$cpu_pc_6', '$cpu_pc_7', '$cpu_pc_8', '$cpu_pc_9', '$cpu_pc_10', '$cpu_pc_11', '$cpu_pc_12', '$cpu_pc_13', '$cpu_pc_14', '$cpu_pc_15');" | mysql -h$sql_host -u$sql_user -p$sql_pass $sql_table;
	
	
	# MEM
	#######################################
	
	mem_free=`cat /proc/meminfo | grep -ohe 'MemFree[s:][: ].*' | awk '{ print $2 }'`;
	mem_available=`cat /proc/meminfo | grep -ohe 'MemAvailable[s:][: ].*' | awk '{ print $2 }'`;
	mem_active=`cat /proc/meminfo | grep -ohe 'Active[s:][: ].*' | awk '{ print $2 }'`;
	mem_inactive=`cat /proc/meminfo | grep -ohe 'Inactive[s:][: ].*' | awk '{ print $2 }'`;
	swap_total=`cat /proc/meminfo | grep -ohe 'SwapTotal[s:][: ].*' | awk '{ print $2 }'`;
	swap_free=`cat /proc/meminfo | grep -ohe 'MemFree[s:][: ].*' | awk '{ print $2 }'`;
	
	echo "INSERT INTO mem (id, date, mem_total, mem_free, mem_avaible, mem_active, mem_inactive, swap_total, swap_free) VALUES  ('$server_id','$unix_time','$mem_total', '$mem_free', '$mem_available', '$mem_active', '$mem_inactive', '$swap_total', '$swap_free');" | mysql -h$sql_host -u$sql_user -p$sql_pass $sql_table;
	
	#echo "mysql -h$sql_host -u$sql_user -p$sql_pass $table;";
	# NET
	########################################




	# HDD
	##################################



done
