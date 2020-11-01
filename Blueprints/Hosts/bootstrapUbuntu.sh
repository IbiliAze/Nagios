#!/bin/bash

sudo apt update -y 

sudo apt install -y nagios-nrpe-plugin
sudo apt install -y nagios-nrpe-server
sudo apt install -y nagios-plugins
sudo systemctl start nagios-nrpe-server
sudo systemctl enable nagios-nrpe-server
sudo systemctl status nagios-nrpe-server

sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2


