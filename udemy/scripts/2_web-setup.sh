#!/bin/bash

# Install necessary Dependencies
echo "########################################"
echo "########Installing Packages#############"
echo "########################################"
sudo apt install wget unzip apache2 -y > /dev/null
echo


# Start and Enable Httpd Service
echo "########################################"
echo "###Starting and Enabling HttpD Sevice###"
echo "########################################"
sudo systemctl start apache2
sudo systemctl enable apache2
echo

# Temp Folder to store intermediate files of Website 
echo "########################################"
echo "########Creating Tmp Folder#############"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles 
echo 

# Get the Necesssary Files for the website
echo "########################################"
echo "####Starting Artifact Deployment########"
echo "########################################"
wget https://www.tooplate.com/zip-templates/2146_nexus_brew.zip > /dev/null
unzip 2146_nexus_brew.zip > /dev/null
sudo cp -r 2146_nexus_brew/* /var/www/html/
echo 


# Restart the Files 
sudo systemctl restart apache2

# Cleanup 
echo "########################################"
echo "############Clean UP####################"
echo "########################################"
sudo rm -rf /tmp/webfiles

echo "Your Website is live"
