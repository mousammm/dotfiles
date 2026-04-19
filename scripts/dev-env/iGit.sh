#!/usr/bin/env bash
set -e # exit on error

if command -v git >/dev/null 2>&1; then 
    echo "Git is installed: $(git -v)"
else 
    echo "Install GIT"
    exit 1
fi

if [[ -f ~/.ssh/id_ed25519 ]]; then
    read -p "SSh key exists, Overwrite? (y/n): " -n 1 -r
    echo 
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting without generating new key"
        exit 0
    fi
fi

rm -rf ~/.ssh

read -p "git name: " gitName
read -p "git email(mxmdia): " gitEmail

if [[ -z "$gitName" || -z "$gitEmail" ]]; then 
    echo "Err: Name and Email must be set"
    exit 1
fi

echo -e "\nConfiguring git..."
git config --global user.name "${gitName}"
git config --global user.email "${gitEmail}"
git config --global init.defaultBranch main
git config --global core.editor "vim"

echo -e "Generating SSH key (ed25519)..."
ssh-keygen -t ed25519 -C "${gitEmail}" -N "" 2>/dev/null

SSHKEY=$(cat ~/.ssh/id_ed25519.pub | cut -d " " -f 2)
hostname=$(cat /etc/hostname)
echo -e "\nTitle: ${hostname}-$(date +%Y%m%d)"
echo "KEY: ${SSHKEY}"
