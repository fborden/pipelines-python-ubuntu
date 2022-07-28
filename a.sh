#!/bin/bash

#num1=10
#num2=30
 
# Add two numbers
#sum=$(($num1 + $num2))
 
# Display the sum
#printf "The sum of $num1 and $num2 is $sum\n\n"

# Check the firewall status
cmd=`sudo ufw status`
printf "\nFirewall Status: $cmd\n\n"

# Check firwall rules for ICPM
cmd=`sudo cat /etc/ufw/before.rules | grep -i icmp`
printf "firewall rules for icmp:\n$cmd\n\n"

# Ping an external Windows machine from within the pipeline
ip_list=( 192.168.0.174 127.0.0.1 127.0.1.1 10.0.2.15 8.8.8.8 google.com 192.168.1.1 )
substring="Destination Host Unreachable"

for ip in "${ip_list[@]}"
do

    response=`ping $ip -c 4`
    printf "Ping response:\n$response\n\n"
    
    #if [[ "$response" =~ "$substring" ]]
    #then
    #    printf "\n\nDOWN: $ip Ping Unsuccessful\n\n"
    #else
    #    printf "\n\nUP: $ip Ping Successful\n\n"
    #fi
    
done
