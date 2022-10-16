#!/bin/bash
echo "----------------------------------------"
echo "LIST OF TOOLS TO INSTALL FOR DEVELOPMENT UBUNTU"
echo "----------------------------------------"

# Ask for the administrator password upfront
sudo -v

echo "------------------------------"
echo "Initializing Development Workspace [×]"

sudo apt -y update
sudo apt -y upgrade

# TOOLS LIST
sudo apt -y install install docker
sudo apt -y install install docker-compose
sudo apt -y install install terminator
sudo apt -y install install net-tools
sudo apt -y install install dnsutils
sudo apt -y install hping3
sudo apt -y install install git
sudo apt -y install install nano 
sudo apt -y install install wget
sudo apt -y install install ssh
sudo apt -y install install samba smbfs
sudo apt -y install mysql-server-5.7 libmysqlclient-dev
sudo apt -y install postgresql-9.6 postgresql-server-dev-9.6 pgadmin3
sudo apt -y install install php
sudo apt -y install install nginx
sudo apt -y install install npm
sudo apt -y install install composer

