#!/bin/bash

set -eox pipefail

# Get version
VERSION=`cat /etc/os-release | grep VERSION= | awk -F'=' '{print $2}'| sed -e "s/'//g" | sed -e 's/"//g'`

# Echo Version
echo "'OS: ${VERSION}'"
