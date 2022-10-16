#!/bin/bash

echo "START CONFIGURATION FOR CSF"

#update your base system with the latest available packages.
sudo apt-get update -y

#dependencies required for CSF
apt-get install sendmail dnsutils unzip git perl iptables libio-socket-ssl-perl libcrypt-ssleay-perl libnet-libidn-perl libio-socket-inet6-perl libsocket6-perl -y

# download csf
wget http://download.configserver.com/csf.tgz

#extract tar ball
tar -xvzf csf.tgz

#change the directory to the extracted directory and install CSF by running the install.sh script
cd csf
bash install.sh

#verify whether all required Iptables modules are installed
perl /usr/local/csf/bin/csftest.pl

#You can configure it by editing the file /etc/csf/csf.conf:
#nano /etc/csf/csf.conf

<<comment
#Change the following line per your requirements:

    TESTING = "0"
    RESTRICT_SYSLOG = "3"
    TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995"

    # Allow outgoing TCP ports
    TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995"

    # Allow incoming UDP ports
    UDP_IN = "20,21,53,80,443"

    # Allow outgoing UDP ports
    # To allow outgoing traceroute add 33434:33523 to this list
    UDP_OUT = "20,21,53,113,123"

    # Allow incoming PING. Disabling PING will likely break external uptime
    # monitoring
    ICMP_IN = "1"
comment

#restart csf
echo "STARTING CSF FIREWALL"
sudo csf -r

#list iptables rules
echo "LISTING ALL IPTABLE RULES"
sudo csf -l

# TERMINAL SHOW HOW TO WORK CSF
echo "----------------------------------------"
echo "Manage CSF with Command Line"
echo "----------------------------------------"
echo "DESCRIPTION: You can also manage the CSF firewall example, allow, deny, or remove an IP address  from the command line interface."
echo "----------------------------------------"
echo "csf -l :: To list all firewall rules"
echo "csf -s :: To stop CSF"
echo "csf -a ip-address :: To allow a specific IP address"
echo "csf -d ip-address :: To deny an IP address"
echo "csf -dr ip-address :: remove blocked IP address from a CSF rule"
echo "csf -g ip-address :: verify whether the IP address is blocked or not"
echo "csf -f :: flush the CSF firewall rules"
echo "csf -x :: disable CSF"
echo "csf -e :: enable CSF"


