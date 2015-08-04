#!/bin/bash
set -e
rm -rf /usr/share/stalk
cp -r ../stalk /usr/share/
cp -r ./requests /usr/share/stalk/service/
cp -r ./flask /usr/share/stalk/service/
cp -r ./werkzeug /usr/share/stalk/service/
cp -r ./jinja2 /usr/share/stalk/service/
cp -r ./markupsafe /usr/share/stalk/service/
cp ./itsdangerous.py /usr/share/stalk/service/
rm -rf /usr/share/stalk/stalkd
cp stalkd /usr/share/stalk/
rm -rf /usr/bin/stalk
cp stalk /usr/bin/
