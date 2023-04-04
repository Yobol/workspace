#!/bin/bash

echo "Current datetime: $(date --rfc-3339='ns')"

echo "Setting timezone as Asia/Shanghai"
sudo apt-get install -y timedatectl
timedatectl set-timezone Asia/Shanghai

echo "Time calibration"
sudo hwclock --systohc

echo "Current datetime: $(date --rfc-3339='ns')"