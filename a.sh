#!/bin/bash


num1 = 10
num2 = 30
 
# Add two numbers
sum =`expr $num1 + $num2`
 
# Display the sum
echo "The sum of $num1 and $num2 is $sum"

# Check the firewall status
cmd = `sudo ufw status`
echo "firewall status: $cmd"

# Ping an external Windows machine from within the pipeline
ip_list = ['192.168.0.174', '127.0.0.1', '127.0.1.1', '10.0.2.15', '8.8.8.8', 'google.com']
substring = "Destination Host Unreachable"

for ip in $(ip_list[@])
do
    response = `ping $ip -c 4`
    
    if [ ! $response =~ $substring ]; # substring was not found in response
        echo "UP: $ip Ping Successful"
    else
        echo "DOWN: $ip Ping Unsuccessful"
    fi
    
done
