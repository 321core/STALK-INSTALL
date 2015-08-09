#!/bin/bash
set -e
sudo yum install -y git
sudo rm -rf /tmp/STALK-INSTALL
cd /tmp
git clone https://github.com/321core/STALK-INSTALL
cd STALK-INSTALL/centos
sh install.sh
