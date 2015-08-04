#!/bin/bash
set -e
sudo rm -rf /tmp/STALK-INSTALL
cd /tmp
git clone https://github.com/321core/STALK-INSTALL
cd STALK-INSTALL/cygwin
sh install.sh
