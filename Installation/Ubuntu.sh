#!/bin/bash


echo step 1
sudo add-apt-repository ppa:ondrej/php
sudo apt update -y

echo step 2
sudo setenforce permissive

echo step 3
getenforce

echo step 4
sudo apt install -y autoconf bc gawk dc build-essential gcc libc6 make wget unzip apache2 php libapache2-mod-php7.2 libgd-dev libmcrypt-dev make libssl-dev snmp libnet-snmp-perl gettext

echo step 5
wget https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz

echo step 6
tar xzf nagios-4.4.5.tar.gz

echo step 7
cd nagioscore-nagios-4.4.5/

echo step 8
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled

echo step 9
sudo make all

echo step 10
sudo make install-groups-users

echo step 11
sudo usermod -a -G nagios www-data

echo step 12
sudo make install

echo step 13
sudo make install-daemoninit

echo step 14
sudo make install-commandmode

echo step 15
sudo make install-config

echo step 16
sudo make install-webconf

echo step 17
sudo a2enmod rewrite cgi

echo step 18
sudo systemctl restart apache2

echo step 19
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

echo step 20
sudo ufw allow Apache

echo step 21
sudo ufw reload

echo step 22
sudo systemctl start nagios.service

echo step 23
sudo systemctl enable nagios.service

echo step 24
sudo systemctl status nagios.service

echo step 25
sudo curl 172.31.83.16/nagios

echo step 26
cd /usr/local/nagios/etc/
echo DO THIS Uncomment the additional config directory for servers. cfg_dir=/usr/local/nagios/etc/servers
sudo vim nagios.cfg

echo step 27
sudo mkdir -p /usr/local/nagios/etc/servers
cd /usr/local/nagios/etc/
echo DO THIS Change the default directory for Nagios plugins as below. $USER1$=/usr/lib/nagios/plugins
sudo vim resource.cfg

echo step 28
echo DO THIS Next, add the nagios admin contacts by editing the configuration file objects/contacts.cfg 
echo ''' DO THIS Change the email address with your own.
define contact{
        ......
        email             email@host.com
} '''
sudo vim objects/contacts.cfg

echo step 29
echo '''DO THIS Paste the following configuration to the end of the line. Paste the following configuration to the end of the line.
define command{
        command_name check_nrpe
        command_line $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
}'''
sudo vim objects/commands.cfg

echo step 30
sudo systemctl restart nagios

echo step 31
sudo systemctl enable nagios

echo step 32
sudo systemctl status nagios

echo step 33
sudo systemctl restart apache2

echo step 34 
sudo systemctl enable apache2

echo step 35
sudo systemctl status apache2

echo step 36 
sudo apt install -y nagios-nrpe-plugin
sudo apt install -y nagios-nrpe-server
sudo apt install -y nagios-plugins

echo step 37
sudo systemctl start nagios-nrpe-server

echo step 38
sudo systemctl enable nagios-nrpe-server












