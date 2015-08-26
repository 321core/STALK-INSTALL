#!/bin/bash
set -e
sudo service stalk stop || true
sudo apt-get install python-pip -y
sudo pip install flask --upgrade
sudo pip install requests --upgrade
sudo cp -r ../stalk /usr/share/
sudo rm /etc/init.d/stalk || true
sudo cp stalk-service /etc/init.d/stalk
sudo cp stalkd /usr/sbin
sudo cp stalk /usr/sbin
sudo service stalk start
sudo update-rc.d stalk defaults
sleep 5s
BASE=$(echo 'import socket;print socket.gethostname().lower().replace(".", "-")' | python)
stalk server $BASE-web localhost 80
stalk server $BASE-tsdb localhost 4242
