#!/bin/bash

# VARIABLES
PACKAGES="wget unzip apache2"
SVC="apache2"
TEMPDIR="/tmp/webfiles"
HOLE="/dev/null"

# ARGUMENT
URL=$1
ARTIFACT=$2

# Install necessary Dependencies
echo "########################################"
echo "########Installing Packages#############"
echo "########################################"
sudo apt install $PACKAGES -y > $HOLE
echo


# Start and Enable Httpd Service
echo "########################################"
echo "###Starting and Enabling HttpD Sevice###"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Temp Folder to store intermediate files of Website 
echo "########################################"
echo "########Creating Tmp Folder#############"
echo "########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo 

# Get the Necesssary Files for the website
echo "########################################"
echo "####Starting Artifact Deployment########"
echo "########################################"
wget $URL > $HOLE
unzip $ARTIFACT.zip > $HOLE
sudo cp -r $ARTIFACT/* /var/www/html/
echo 


# Restart the Files 
sudo systemctl restart $SVC

# Cleanup 
echo "########################################"
echo "############Clean UP####################"
echo "########################################"
sudo rm -rf $TEMPDIR

echo "Your Website is live"
