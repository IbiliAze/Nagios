#!/bin/bash


[ Creating a user ]

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin #overwrite an existing user

htpasswd /usr/local/nagios/etc/htpasswd.users ibi #create a new user



[ Datastore ]

sudo cat /usr/local/nagios/etc/htpasswd.users #user database




