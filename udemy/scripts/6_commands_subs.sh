#!/bin/bash

echo "Welcome $USER on $HOSTNAME"

FREERAM=$(free -m | grep Mem | awk '{print $4}')
LOAD=`uptime | awk '{print $9}'`
ROOTFREE=$(df -h | grep '/dev/sda1/' | awk '{print $4}')


echo "#########################################"
echo "Available FREE RAM is $FREERAM mb"
echo "#########################################"
echo "Current LOAD Avergae is $LOAD"
echo "#########################################"
echo "FREE ROOT partition Sixe is $ROOTFREE"
echo "#########################################"
