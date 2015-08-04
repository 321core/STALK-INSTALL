#!/bin/bash
set -e
sudo apt-get install python-pip -y
sudo pip install flask --upgrade
sudo pip install requests --upgrade
sudo cp -r ../stalk /usr/share/
sudo cp stalkd /usr/sbin
sudo cp stalk /usr/sbin

RET=$(ps -p1 | grep system)
if [ -n "$RET" ]; 
then # SYSTEMD
  sudo cp stalk.service /lib/systemd/system/
  sudo systemctl enable stalk.service
  sudo systemctl start stalk.service
else # UPSTART
  sudo cp stalk.conf /etc/init/
  sudo service stalk start
fi
