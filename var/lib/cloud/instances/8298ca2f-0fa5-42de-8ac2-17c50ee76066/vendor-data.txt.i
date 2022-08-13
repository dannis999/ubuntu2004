Content-Type: multipart/mixed; boundary="===============8793334150512303801=="
MIME-Version: 1.0
Number-Attachments: 6

--===============8793334150512303801==
MIME-Version: 1.0
Content-Type: text/x-shellscript
Content-Disposition: attachment; filename="part-001"

#!/bin/bash

if [ -f /swapfile ]; then
    exit 0
fi

if [ -f /var/lib/vultr/states/.swapfile ]; then
    exit 0
fi

MEMORY=$(df -BG / | tail -n 1 | awk -F' ' '{print $2}' | sed 's/G//g')

# Lets not make swaps on small drives
if [ "${MEMORY}" -lt "10" ]; then
    exit 0
fi

MEMORY=$((MEMORY * 100))
if [ "${MEMORY}" -gt "8000" ]; then
    MEMORY=8000
fi

if [ "${MEMORY}" -lt "1000" ]; then
    MEMORY=1000
fi

dd if=/dev/zero of=/swapfile bs=1M count=${MEMORY}
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab

mkdir -p /var/lib/vultr/states/
touch /var/lib/vultr/states/.swapfile

--===============8793334150512303801==
MIME-Version: 1.0
Content-Type: text/x-shellscript
Content-Disposition: attachment; filename="part-002"

#!/bin/bash

if [ -d /usr/local/cuda ]; then
	rm -rf /usr/local/cuda/
fi

if [ -d /opt/nvidia ]; then
	rm -rf /opt/nvidia
fi

--===============8793334150512303801==
MIME-Version: 1.0
Content-Type: text/cloud-config
Content-Disposition: attachment; filename="part-003"

#cloud-config
{"package_upgrade":true,"disable_root":false,"manage_etc_hosts":true,"system_info":{"default_user":{"name":"root"}},"ssh_pwauth":1,"chpasswd":{"list":["root:$6$4YrA86NTlz0fWcqh$SWIR.on5xnBjqdyI08ncusa02pKsJVPCe3lgILGYc6EUx7j.bsCMkH10Ro.8pG76iNV1FgCPnYfpq0927zKF5."],"expire":false}}
--===============8793334150512303801==
MIME-Version: 1.0
Content-Type: text/x-shellscript
Content-Disposition: attachment; filename="part-004"

#!/bin/bash

#
# Functions
#

function check_command_exists () {
    OUT="0"
    if ! [ -z "$(which $1)" ]; then
        OUT="1"
    fi
    echo "${OUT}"
}

function print () {
    echo "${@}" >> /var/log/cloudinit_networking.log
    echo "${@}"
}

function get_interfaces () {
    if [ -z "${INTERFACES}" ]; then
        INTERFACES=($(ls -l /sys/class/net/ | grep "/net/e" | awk -F' ' '{print $9}'))
    fi
}

#
# Start script
#

# Get the interface list
get_interfaces

if [ "$(check_command_exists ethtool)" == "1" ]; then
    for int in "${INTERFACES[@]}"
    do
        ethtool -L ${int} combined $(nproc --all)
    done
else
    print "Failed to find ethtool, cannot configure multi-queue!"
fi

SYSCTL_DIR="/etc/sysctl.d"
if [ -d /usr/lib/sysctl.d/ ]; then
    SYSCTL_DIR="/usr/lib/sysctl.d"
fi

if [ -f ${SYSCTL_DIR}/90-vultr.conf ]; then
    chattr -i ${SYSCTL_DIR}/90-vultr.conf
fi

echo '# Do not modify this file unless you know how to remove this lock and the consequences' > ${SYSCTL_DIR}/90-vultr.conf
echo '# thereof. Support will not be offered for network performance if this file is removed.' >> ${SYSCTL_DIR}/90-vultr.conf
echo "" >> ${SYSCTL_DIR}/90-vultr.conf
echo "# Accept IPv6 advertisements when forwarding is enabled" >> ${SYSCTL_DIR}/90-vultr.conf

for int in "${INTERFACES[@]}"
do
    echo "net.ipv6.conf.${int}.accept_ra=2" >> ${SYSCTL_DIR}/90-vultr.conf
    sysctl -w net.ipv6.conf.${int}.accept_ra=2
done
echo 'net.core.default_qdisc=fq' >> ${SYSCTL_DIR}/90-vultr.conf
echo 'net.ipv4.tcp_congestion_control=bbr' >> ${SYSCTL_DIR}/90-vultr.conf
echo 'net.ipv4.tcp_rmem=4096 87380 33554432' >> ${SYSCTL_DIR}/90-vultr.conf
echo 'net.ipv4.tcp_wmem=4096 87380 33554432' >> ${SYSCTL_DIR}/90-vultr.conf
echo "" >> ${SYSCTL_DIR}/90-vultr.conf

# Do not modify this file unless you know how to remove this lock and the consequences
# thereof. Support will not be offered for network performance if this file is removed.
if [ -f ${SYSCTL_DIR}/90-vultr.conf ]; then
    chattr +i ${SYSCTL_DIR}/90-vultr.conf
fi

sysctl -w net.core.default_qdisc=fq
sysctl -w net.ipv4.tcp_congestion_control=bbr
sysctl -w net.ipv4.tcp_rmem="4096 87380 33554432"
sysctl -w net.ipv4.tcp_wmem="4096 87380 33554432"

--===============8793334150512303801==
MIME-Version: 1.0
Content-Type: text/x-shellscript
Content-Disposition: attachment; filename="part-005"

#!/bin/bash

sed -i -e 's/^ListenAddress 127.0.0.1//g' /etc/ssh/sshd_config
if ! [ -f /var/lib/vultr/states/.reboot ]; then
    systemctl reload sshd
fi

--===============8793334150512303801==
MIME-Version: 1.0
Content-Type: text/x-shellscript
Content-Disposition: attachment; filename="part-006"

#!/bin/bash

if [ -f /var/lib/vultr/states/.reboot ]; then
	rm -f /var/lib/vultr/states/.reboot
	shutdown -r 1
	exit 0
fi

--===============8793334150512303801==--
