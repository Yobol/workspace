#!/bin/bash

sudo apt-get install -y git

gh_account_name="yobol"
gh_account_email="m15152036579@163.com"

gh_ssh_crypt="ed25519"
gh_ssh_prefix="id_${gh_ssh_crypt}_github"
# GitHub
git config user.name ${gh_account_name}
git config user.email ${gh_account_email}

# # setup SSH keys associated with your Github account: 
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t ${gh_ssh_crypt} -C ${gh_account_email}
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/${gh_ssh_prefix}
cat ~/.ssh/${gh_ssh_prefix}.pub
# copy and new SSH key: # https://github.com/settings/keys
# TODO 添加交互逻辑：确认

git remote set-url origin git@github.com:Yobol/workspace.git