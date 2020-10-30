#!/bin/bash


[ Nagios ]

sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg #pre-flight check
echo "alias pfc='sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg'" >> ~/.bashrc



[ Logs ]
tail /usr/local/nagios//var/nagios.log -f

