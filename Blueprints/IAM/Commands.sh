#!/bin/bash


[ Creating a user ]

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin #overwrite an existing user

htpasswd /usr/local/nagios/etc/htpasswd.users ibi #create a new user



[ Datastore ]

sudo cat /usr/local/nagios/etc/htpasswd.users #user database



[ Notifications ]

sudo apt install sendemail -y
sudo apt-get install libnet-ssleay-perl
sudo apt-get install libcrypt-ssleay-perl
sudo apt-get install libio-socket-ssl-perl
sendemail -u this is a test -m "testing" -s smtp.googlemail.com:587 -xu user1 -xp password1 -o tls=yes -f test@gmail.com -t test@gmail.com

sudo mkdir -p /usr/local/nagios/etc/objects/logs

