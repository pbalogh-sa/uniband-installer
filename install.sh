#!/bin/bash

sudo apt-get install curl mc tshark wireshark gpsd rfkill iw
sudo chown root.$USER /usr/bin/tshark 
sudo chown root.$USER /usr/bin/dumpcap
sudo chmod 4754 /usr/bin/tshark
sudo chmod 4754 /usr/bin/dumpcap
echo "deb https://www.kismetwireless.net/code/ precise kismet" > tmp.list
sudo cat tmp.list >> /etc/apt/sources.list
sudo curl https://www.kismetwireless.net/code/dists/kismet-release.gpg | sudo apt-key add - 
rm tmp.list
sudo apt-get update
sudo apt-get install kismet
mkdir -p $HOME/.kismet
cp pkgs/kismet_ui.conf $HOME/.kismet/kismet_ui.conf
sudo cp -r usr /
sudo ln -s /usr/local/lib/libcconf.so.1.0.0 /usr/local/lib/libcconf.so.1.0
sudo ln -s /usr/local/lib/libcconf.so.1.0.0 /usr/local/lib/libcconf.so.1
sudo chmod 4755 /usr/local/bin/horst
sudo chmod 4755 /usr/local/sbin/set_devices.sh
sudo ldconfig
sudo dpkg -i pkgs/uniband-monitor_0.9-1_amd64.deb
tar -xf pkgs/allow_14_chan.tar.gz
cd allow_14_chan
./install14.sh
cd ..
sudo rm /lib/crda
sudo ln -s /usr/lib/crda /lib/crda
cp -r share $HOME/.local/
