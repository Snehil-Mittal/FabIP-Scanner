#!/bin/bash

if [ "$1" == "" ]
then
echo "You forgot to mention ip!"

else
for x in `seq 1 254`
do
ping -c 1 $1.$x | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done;
fi
