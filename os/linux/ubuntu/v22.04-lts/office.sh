#!/bin/bash

# https://archive.ubuntukylin.com/ubuntukylin/pool/partner/
wget -O wine https://archive.ubuntukylin.com/ubuntukylin/pool/partner/ukylin-wine_70.6.3.25_amd64.deb
sudo dpkg -i wine && rm -f wine

wget -O wechat https://archive.ubuntukylin.com/ubuntukylin/pool/partner/ukylin-wechat_3.0.0_amd64.deb
sudo dpkg -i wechat
sudo apt-get --fix-broken install -y && sudo apt-get install -y xdotool
sudo dpkg -i wechat && rm -f wechat

wget -O wework https://archive.ubuntukylin.com/ubuntukylin/pool/partner/ukylin-wxwork_1.0_amd64.deb
sudo dpkg -i wework && rm -f wework

wget -O wemeet https://archive.ubuntukylin.com/ubuntukylin/pool/partner/TencentMeeting_2.8.0.0_amd64.deb
sudo dpkg -i wemeet && rm -f wemeet

wget -O wps https://archive.ubuntukylin.com/ubuntukylin/pool/partner/wps-office_11.1.0.11664_amd64.deb
sudo dpkg -i wps && rm -f wps