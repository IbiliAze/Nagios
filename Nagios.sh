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

