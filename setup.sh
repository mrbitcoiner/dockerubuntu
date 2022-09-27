#!/usr/bin/env bash
#####################################
# One command setup docker and docker-compose on ubuntu
#
# By Mr. Bitcoiner
####################################
# Script

set -e

sudo apt update

sudo apt install -y \
    apt-transport-https ca-certificates curl gnupg lsb-release

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo printf "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\n" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update 

sudo apt install -y \
    docker-ce docker-ce-cli containerd.io

os=$(uname -s)
os_lowercase=${os,,}

sudo curl -L "https://github.com/docker/compose/releases/download/v2.11.1/docker-compose-${os_lowercase}-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

printf 'Setup done.\n'