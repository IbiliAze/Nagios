#!/bin/bash


[ Nagios ]

sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg #pre-flight check



[ Logs ]
tail /usr/local/nagios//var/nagios.log -f

