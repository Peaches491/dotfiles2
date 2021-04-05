#!/bin/bash --norc
set -euo pipefail

sudo apt-get update

# Apt + SSL
sudo apt-get install --assume-yes \
  apt-transport-https \
  apt-utils \
  ca-certificates \
  openssl \
  software-properties-common

# Kernel
sudo apt-get install --assume-yes \
  "linux-headers-$(uname -r)" \
  "linux-image-$(uname -r)"

# Pi-Rho PPA
sudo apt-add-repository --yes ppa:pi-rho/dev
sudo apt-get update

# User tools
sudo apt-get install --assume-yes \
  build-essential \
  curl \
  tmux=2.0-1~ppa1~t \
  tree \
  wget \
  vagrant \
  vim \
  zsh

# System tools
sudo apt-get install --assume-yes \
  etckeeper \
  htop \
  ifstat \
  iftop \
  inotify-tools \
  iotop \
  ncdu \
  nmap \
  sysstat

# VirtualBox
sudo apt-get install --assume-yes \
  virtualbox \
  virtualbox-dkms \
  virtualbox-guest-additions-iso
