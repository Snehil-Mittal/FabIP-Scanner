#!/bin/bash

echo "**********WELCOME TO THE SCANTOOL!***********"

echo "Press '1' for IP Sweep and '2' for PORT Scanning and '3' for both"
read choice 

if [ "$choice" == "1" ]
then
echo "You are running IP Sweep"
echo "Enter your IP as example '192.168.4'"
read -p "IP: " ip
./ipsweep.sh $ip > ips.txt

elif [ "$choice" == "2" ]
then
echo "You are running PORT Scanner"
echo "Enter your IP as example '192.168.4.1'"
read -p "IP: " ip
python3 scanner.py $ip

elif [ "$choice" == "3" ]
then
echo "You are running PORT Scanner over a range of active IPs"
echo "Enter the IP as example '192.168.124'"
read -p "IP: " ip
./ipsweep.sh $ip > ips.txt
for i in $(cat ips.txt)
do
python3 scanner.py $i
done;

else
echo "Wrong Choice... Run again!"
fi 

