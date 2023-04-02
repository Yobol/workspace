#!/bin/bash

sudo apt-get install -y git

gh_account_name="yobol"
gh_account_email="m15152036579@163.com"
# GitHub
git config --global user.name ${gh_account_name}
git config --gloabal user.email ${gh_account_email}

# # setup SSH keys associated with your Github account: 
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t ed25519 -C ${gh_account_email}
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
# copy and new SSH key: # https://github.com/settings/keys
# TODO 添加交互逻辑：确认