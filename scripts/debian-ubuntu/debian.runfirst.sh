#!/bin/sh

# Default updates
apt-get update
apt-get -y upgrade

# Install base dependencies to keep integration stable with other scripts
apt-get install -y sudo curl 