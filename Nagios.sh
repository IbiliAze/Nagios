#!/bin/bash


[ Nagios ]

sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg #pre-flight check
echo "alias pfc='sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg'" >> ~/.bashrc



[ Plugins ] 

ll /usr/lib/nagios/plugins/ #plugins

/usr/lib/nagios/plugins/check_users #run a plugin



[ Logs ]

tail /usr/local/nagios//var/nagios.log -f
echo "alias nagioslogs='tail /usr/local/nagios//var/nagios.log -f'" >> ~/.bashrc



[ NRPE ]

sudo apt install -y nagios-nrpe-plugin
sudo apt install -y nagios-nrpe-server
sudo apt install -y nagios-plugins
sudo systemctl start nagios-nrpe-server
sudo systemctl enable nagios-nrpe-server
sudo systemctl status nagios-nrpe-server
sudo apt install -y firewalld
sudo firewall-cmd --add-port=5666/tcp --permanent
sudo firewall-cmd --add-port=22/tcp --permanent
sudo firewall-cmd --add-port=80/tcp --permanent
sudo firewall-cmd --reload
sudo apt install -y net-tools
netstat | grep nagios
netstat | grep nrpe
{optional} #for searching
sudo apt install -y mlocate
sudo updatedb
locate -i nrpe
/usr/lib/nagios/plugins/check_nrpe -H localhost #check is its running


{NRPE Client}

echo "allowed_hosts=127.0.0.1,::1,54.163.176.159" >> /etc/nagios/nrpe.cfg #run on client machine to add the NRPE server a trusted NRPE server

echo "command[check_swap]=/usr/lib/nagios/plugins/check_swap -w 10 -c 5" >> /etc/nagios/nrpe.cfg #add a check command
echo "command[check_http]=/usr/lib/nagios/plugins/check_http -w 10 -c 5" >> /etc/nagios/nrpe.cfg


{NRPE Server}

/usr/lib/nagios/plugins/check_nrpe -H 3.85.37.37 #test NRPE connection to client
/usr/lib/nagios/plugins/check_nrpe -H 3.85.37.37 -c check_load
/usr/lib/nagios/plugins/check_nrpe -H 3.85.37.37 -c check_users
/usr/lib/nagios/plugins/check_nrpe -H 3.85.37.37 -c check_swap



