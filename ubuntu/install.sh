#!/bin/bash
set -e
sudo apt-get install python-pip -y
sudo pip install flask --upgrade
sudo pip install requests --upgrade

sudo rm -rf /usr/share/stalk || true
sudo cp -r ../stalk /usr/share/

sudo rm -rf /usr/sbin/stalkd || true
sudo cp stalkd /usr/sbin

sudo rm -rf /usr/bin/stalk || true
sudo cp stalk /usr/sbin

RET=$(ps -p1 | grep system)
if [ -n "$RET" ]; 
then # SYSTEMD
  echo "install STALK as Systemd service..."
  sudo rm -rf /lib/systemd/system/stalk.service || true
  sudo cp stalk.service /lib/systemd/system/
  
  sudo systemctl enable stalk.service
  sudo systemctl start stalk.service

else # UPSTART
  echo "install STALK as Upstart service..."
  sudo rm -rf /etc/init/stalk.conf || true
  sudo cp stalk.conf /etc/init/
  sudo service stalk start
fi
