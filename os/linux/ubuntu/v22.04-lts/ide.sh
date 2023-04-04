#!/bin/bash

wget -O code https://archive.ubuntukylin.com/ubuntukylin/pool/partner/code_1.67.2_amd64.deb
sudo dpkg -i code && rm -f code