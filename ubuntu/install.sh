#!/bin/bash
set -e
sudo apt-get install python-pip -y
sudo pip install flask --upgrade
sudo pip install requests --upgrade
sudo cp -r ../stalk /usr/share/
sudo cp stalk.conf /etc/init/
sudo cp stalkd /usr/sbin
sudo cp stalk /usr/sbin
sudo service stalk start
