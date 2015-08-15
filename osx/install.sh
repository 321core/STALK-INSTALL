#!/bin/bash
set -e
launchctl unload /Library/LaunchAgents/com.321core.stalk.plist || true
sudo rm -rf /opt/stalk
sudo mkdir -p /opt
sudo cp -r ../stalk /opt/
sudo cp -r ./requests /opt/stalk/service/
sudo cp -r ./flask /opt/stalk/service/
sudo cp -r ./werkzeug /opt/stalk/service/
sudo cp -r ./jinja2 /opt/stalk/service/
sudo cp -r ./markupsafe /opt/stalk/service/
sudo cp ./itsdangerous.py /opt/stalk/service/
sudo rm -rf /opt/stalk/stalkd
sudo cp stalkd /opt/stalk/
sudo rm -rf /usr/local/bin/stalk
sudo cp stalk /usr/local/bin/
sudo mkdir -p /Library/LaunchAgents/
sudo rm -rf /Library/LaunchAgents/com.321core.stalk.plist
sudo cp com.321core.stalk.plist /Library/LaunchAgents/
sudo launchctl load -w /Library/LaunchAgents/com.321core.stalk.plist
sudo launchctl start com.321core.stalk
sleep 3s
open 'http://localhost:8900'
