#!/bin/bash

#num1=10
#num2=30
 
# Add two numbers
#sum=$(($num1 + $num2))
 
# Display the sum
#printf "The sum of $num1 and $num2 is $sum\n\n"

# Check the firewall status
cmd=`sudo ufw status`
#printf "\nFirewall Status: $cmd\n\n"

# Check firwall rules for ICPM
cmd=`sudo cat /etc/ufw/before.rules | grep -i icmp`
#printf "Firewall rules for ICMP/ping:\n$cmd\n\n"

# Ping an external Windows machine from within the pipeline
ip_list=( 192.168.0.174 127.0.0.1 127.0.1.1 10.0.2.15 8.8.8.8 192.168.1.1 cincom.com )
substring="Destination Host Unreachable"

for ip in "${ip_list[@]}"
do

    #response=`ping -w 30 -c 1 $ip`
    response=$(ping -w 30 -c 1 $ip)
    rc=$?
    if [[ $rc -eq 1 ]]
    then
         #printf "\n$response\n"
         printf "%s\n" ---------------
         printf "%s\n" DOWN: $ip - Ping Unsuccessful
    else
        #printf "\n$response\n"
        printf "%s\n" ---------------
        printf "%s\n" UP: $ip Ping - Successful
    fi
    
    #if [[ "$response" =~ "$substring" ]]
    #then
    #    printf "\n\nDOWN: $ip Ping Unsuccessful\n\n"
    #else
    #    printf "\n\nUP: $ip Ping Successful\n\n"
    #fi
    
done
