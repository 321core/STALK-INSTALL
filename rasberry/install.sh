#!/bin/bash
set -e
sudo apt-get install python-pip -y
sudo pip install flask --upgrade
sudo pip install requests --upgrade
sudo cp -r ../stalk /usr/share/
sudo rm /etc/init.d/stalk
sudo cp stalk-service /etc/init.d/stalk
sudo cp stalkd /usr/sbin
sudo cp stalk /usr/sbin
sudo service stalk start
sudo update-rc.d stalk defaults
