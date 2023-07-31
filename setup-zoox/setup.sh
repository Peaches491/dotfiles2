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

# User tools
sudo apt-get install --assume-yes \
  build-essential \
  cmake \
  curl \
  git \
  tmux \
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

# Tmux build dependencies
sudo apt-get install --assume-yes \
  libncurses5-dev \
  libncursesw5-dev \
  libevent-dev

# Git build dependencies
sudo apt-get install --assume-yes \
  asciidoc \
  dh-autoreconf \
  docbook2x \
  gettext \
  install-info \
  libcurl4-gnutls-dev \
  libexpat1-dev \
  libssl-dev \
  libz-dev \
  xmlto

# Vim build dependencies
sudo apt-get install --assume-yes \
  libatk1.0-dev \
  libcairo2-dev \
  libgtk2.0-dev \
  liblua5.1-0-dev \
  libncurses5-dev \
  libperl-dev \
  libx11-dev \
  libxpm-dev \
  libxt-dev \
  lua5.1 \
  python3-dev \
  ruby-dev
