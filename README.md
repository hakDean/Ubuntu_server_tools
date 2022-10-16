# SERVER CONFIGURATIONS UBUNTU
A bunch of configuration files for ubuntu server home lab enviroment

### -------------------------------------------
### IMPORTANT - Requirement for all servers

###### Update and Upgrade with enable Automatic Updates
- **root@comp %** ```sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt-get autoremove```
- **root@comp %** ```sudo apt install unattended-upgrades```
- **root@comp %** ```dpkg-reconfigure --priority=low unattended-upgrades```

### -------------------------------------------
### Setup static ipaddr for ubuntu server
Modify this file to suit your network device -> ens18 ==> eth0

- **root@comp %** ```sudo nano /etc/netplan/netplan1.yaml```

```
network:
   version: 2
   ethernets:
     ens18:
       dhcp4: False
       addresses:
          - 192.168.0.245/16
       gateway4: 192.168.0.1
       nameservers:
          addresses: [8.8.8.8,4.4.4.4]
```

- **root@comp %** ```sudo netplan apply```
- **root@comp %** ```sudo apt install net-tools```
- **root@comp %** ```sudo ifconfig grep | inet```

### -------------------------------------------
### REMOVE DEFAULT LINUX DNS STUB RESOLVER
Disable systemd-resolved listener on port 53 dns will use this port
- **root@comp %** ```sudo systemctl stop systemd-resolved.service```
- **root@comp %** ```sudo systemctl disable systemd-resolved.service```

The next command should fail ping: google.com: Temporary failure in name resolution
- **root@comp %** ```ping www.google.com```

Now modify the resolv file and change the 127.0.0.53 to point to googles dns 8.8.8.8 or 4.4.4.4
- **root@comp %** ```sudo nano /etc/resolv.conf```

Now ping will work
- **root@comp %** ```ping www.google.com```

### -------------------------------------------
### CHECK DNS OF UBUNTU SERVER
- **root@comp %** ```sudo apt install dnsutils```

test if ok with answer --> status: NOERROR
- **root@comp %** ```dig sigok.verteiltesysteme.net @192.168.0.222 -p 5335 +dnssec```

test if fail no answer --> status: SERVFAIL
- **root@comp %** ```dig sigfail.verteiltesysteme.net @192.168.0.222 -p 5335 +dnssec```

### -------------------------------------------
### VARIOUS SERVERS FOLDER FOR SYSTEMS

#### CSF - Firewall 

#### OpenNebula - replace proxmox / vmware VM
OpenNebula is an opensource, feature-rich and flexible Virtualization solution that helps you build and manage Virtualized Data Centers and enterprise clouds.
Offcial Website -https://opennebula.io/

#### NethServer - all in one solution

#### Zabbix - monitor

#### Grafana - graphing

#### KeePass - passwords use via google drive / one drive sync


### -------------------------------------------
### TO DO LIST

* ZERO TIER - for vpn replace all in one 



```
	- name: initialize file path
  	set_fact:
    	file_path: "test/testing2.txt"

	- name: "Copy {{ file_path }} file"
  	copy:
    	content: "# Testing file creation in ansible."
    	dest: "{{ file_path }}"
    	owner: user1
    	group: user1
    	mode: "0661"

	- name: Print the msg
  	debug:
    	msg: "Copied {{ file_path }} file."
```
