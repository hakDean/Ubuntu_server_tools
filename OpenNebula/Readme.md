# #######################################################
# INSTALL OPENNEBULA 
# #######################################################

Testing Environment:Ubuntu 18.04 LTS

Hostname - www.example.com

ip Address - 192.168.1.50
### ----------------------------------------------------------

- **root@comp %** ```apt update ; apt install mariadb-server mariadb-client build-essential net-tools curl git software-properties-common -y```
- **root@comp %** ```systemctl start mariadb ; systemctl enable mariadb```
- **root@comp %** ```mysql_secure_installation```
- **root@comp %** ```mysql -u root -p```

```
CREATE DATABASE opennebula;
CREATE USER 'oneadmin'@'localhost' IDENTIFIED BY 'oneadmin';
GRANT ALL ON opennebula.* TO 'oneadmin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
```

- **root@comp %** ```wget -q -O- https://downloads.opennebula.org/repo/repo.key | sudo apt-key add -```
- **root@comp %** ```echo "deb https://downloads.opennebula.org/repo/5.6/Ubuntu/18.04 stable opennebula" | sudo tee /etc/apt/sources.list.d/opennebula.list```
- **root@comp %** ```apt update ; apt install opennebula opennebula-sunstone opennebula-gate opennebula-flow -y```
- **root@comp %** ```sudo /usr/share/one/install_gems```
- **root@comp %** ```systemctl start opennebula opennebula-sunstone ; systemctl enable opennebula opennebula-sunstone```
- **root@comp %** ```nano /etc/one/oned.conf```
- **root@comp %** ```systemctl status opennebula```

- **root@comp %** ```nano /var/lib/one/.one/one_auth```
User - oneadmin          | Password - RyibUScheym9

OPEN WEBBROWER ==> http://192.168.1.50:9869
# ----------------------------------------------------------