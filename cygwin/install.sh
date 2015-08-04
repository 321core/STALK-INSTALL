#!/bin/bash
set -e
sudo rm -rf /usr/share/stalk
sudo cp -r ../stalk /usr/share/
sudo cp -r ./requests /usr/share/stalk/service/
sudo cp -r ./flask /usr/share/stalk/service/
sudo cp -r ./werkzeug /usr/share/stalk/service/
sudo cp -r ./jinja2 /usr/share/stalk/service/
sudo cp -r ./markupsafe /usr/share/stalk/service/
sudo cp ./itsdangerous.py /usr/share/stalk/service/
sudo rm -rf /usr/share/stalk/stalkd
sudo cp stalkd /usr/share/stalk/
sudo rm -rf /usr/bin/stalk
sudo cp stalk /usr/bin/
