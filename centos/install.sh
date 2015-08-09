#!/bin/bash
set -e
echo "*** Update Modules..."
sudo yum install -y python-pip
sudo pip install flask --upgrade
sudo pip install requests --upgrade
echo "*** Copy executables..."
sudo rm -rf /usr/share/stalk
sudo cp -r ../stalk /usr/share/
sudo rm -rf /usr/sbin/stalkd
sudo cp stalkd /usr/sbin
sudo rm -rf /usr/bin/stalk
sudo cp stalk /usr/sbin
RET=$(ps -p1 | grep systemd) || true
if [ -n "$RET" ]; then
	echo "*** install STALK as Systemd service..."
	sudo rm -rf /lib/systemd/system/stalk.service
	sudo cp stalk.service /lib/systemd/system/
	sudo systemctl enable stalk.service
	sudo systemctl start stalk.service
else
	echo "*** install STALK as Upstart service..."
	sudo rm -rf /etc/init/stalk.conf
	sudo cp stalk.conf /etc/init/
	sudo service stalk start
fi
