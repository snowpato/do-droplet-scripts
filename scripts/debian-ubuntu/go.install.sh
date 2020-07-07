#!/bin/sh

GOVER="1.14.4"
GOINSTALL="go${GOVER}.linux-amd64.tar.gz"
GOPATH="/usr/local"

#Install Golang
echo "Downloading Go version $GOVER"

cd ~
wget "https://dl.google.com/go/${GOINSTALL}"

echo "Installing in ${GOPATH}"
sudo tar -C ${GOPATH} -xzf ${GOINSTALL} && rm ${GOINSTALL}

#Edit profile to add Go as command
#Need to add after PATH definition.
echo "Adding Go as command"
echo "1) Adding: 'export PATH=\$PATH:${GOPATH}/go/bin' in /etc/profile"
sed -i -e '$a\
# Adding Go as Path' /etc/profile
sed -i -e '$aexport PATH=\$PATH:'"${GOPATH}"'/go/bin' /etc/profile 
echo "2) Invoking 'source /etc/profile'"
. /etc/profile

echo "Installed go in ${GOPATH}. Try running 'go env'"
