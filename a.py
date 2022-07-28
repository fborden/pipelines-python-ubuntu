import os
from subprocess import Popen, PIPE

num1 = 10
num2 = 30
 
# Add two numbers
sum = float(num1) + float(num2)
 
# Display the sum
print('The sum of {0} and {1} is {2}'.format(num1, num2, sum))

# Check the firewall status
process = Popen(['sudo', 'ufw', 'status'], stdout=PIPE, stderr=PIPE)
stdout, stderr = process.communicate()
stdout, stderr

# Ping an external Windows machine from within the pipeline
ip_list = ['192.168.0.174', '127.0.0.1', '127.0.1.1', '10.0.2.15', '8.8.8.8', 'google.com']
for ip in ip_list:
    response = os.popen(f"ping {ip} -c 4").read()
    if "Received = 4" in response:
        print(f"UP {ip} Ping Successful")
    else:
        print(f"DOWN {ip} Ping Unsuccessful")
