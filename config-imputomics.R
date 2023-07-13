#!/bin/bash

sudo apt-get install -y software-properties-common dirmngr gnupg apt-transport-https ca-certificates software-properties-common

wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo add-apt-repository -y "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt-get update
sudo apt-get install -y r-base-core=4.3.0-1.2204.0

sudo apt-get install -y g++ build-essential gdebi-core cmake libxml2-dev libcurl4-openssl-dev libx11-dev mesa-common-dev libglu1-mesa-dev libssl-dev libgmp3-dev zlib1g-dev libjpeg-dev libpng-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev gh

wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.20.1002-amd64.deb
sudo gdebi -n shiny-server-1.5.20.1002-amd64.deb

apt-get moo
# change user to shiny
cd /home/shiny
mkdir gits
