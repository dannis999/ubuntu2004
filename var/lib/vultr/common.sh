#!/bin/bash

################################################################
# Variables
################################################################

CUDNN_DRIVER="cudnn-8.2.1-cuda11.3_0.tar.bz2"
CUDNN_DRIVER_URL="https://anaconda.org/anaconda/cudnn/8.2.1/download/linux-64/cudnn-8.2.1-cuda11.3_0.tar.bz2"
APPREPO_KEY=$(cat <<ENDFILE
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.22 (GNU/Linux)

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
SSmnWHkcE8C70A==
=ynen
-----END PGP PUBLIC KEY BLOCK-----
ENDFILE
)

################################################################
# CentOS 7 Unique Functions
################################################################

function centos7_install_ius
{
	# IUS requires EPEL repository on CentOS 7
	yum -y install epel-release
	yum clean all
	yum -y update

	yum install -y https://repo.ius.io/ius-release-el7.rpm
	yum -y install yum-plugin-replace

    yum -y --enablerepo ius-testing update ius-release
    yum -y --enablerepo ius-testing clean all
}

function centos7_install_nginx
{
	yum install -y https://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

	if [ -f /etc/yum.repos.d/epel.repo ]; then
		sed --follow-symlinks -i -e "s/^enabled=1/enabled=1\nexclude=nginx*/" /etc/yum.repos.d/epel.repo
	fi

	yum -y install nginx

    cat <<EOF > /etc/nginx/nginx.conf
user nginx;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 2000;
}

http {
        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        server_tokens off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        gzip on;

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}
EOF

	mkdir -p /etc/nginx/sites-enabled/
	mkdir -p /etc/nginx/sites-available/
	rm -f /etc/nginx/conf.d/*

	systemctl stop nginx.service
	systemctl disable nginx.service
}

function centos_install_mysql_57
{
	# add repo, install
	echo "installing MySQL..."

	yum install -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
	yum -y install mysql-community-server

	systemctl stop mysqld.service
	systemctl disable mysqld.service

	echo "done installing MySQL."
}

# configures memory usage settings for mysql in my.cnf
# param string mysql_innodb_buffer_pool_size
# param string mysql_table_open_cache
function centos7_configure_mysql57
{
	# backup default confs
	mkdir -p /var/default-conf/mysql
	cp /etc/my.cnf /var/default-conf/mysql

	mkdir -p /var/default-conf/mysql/my.cnf.d
	mv /etc/my.cnf.d/* /var/default-conf/mysql/my.cnf.d

	# make folders and log files
	mkdir -p /var/lib/mysqltmp
	chown mysql:mysql /var/lib/mysqltmp

	touch /var/log/mysqld-error.log
	chown mysql:mysql /var/log/mysqld-error.log

	touch /var/log/mysqld-slow.log
	chown mysql:mysql /var/log/mysqld-slow.log

	touch /var/log/mysqld-general.log
	chown mysql:mysql /var/log/mysqld-general.log

	# configure MySQL. This configuration is based off the 5.7 default configs and template.
	# /usr/share/mysql/my-default.cnf
	# /etc/my.cnf.d/mysql-server.cnf
	# /etc/my.cnf
	cat >/etc/my.cnf <<EOF
#
# This configuration file targets MySQL 5.7.12
# For advice on how to change settings please see: http://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html
# Example conf files are in /usr/share/mysql/
# The default mysql conf files are in /var/default-conf/mysql/
#


#
# This group is read by both by the client and the server, use it for options that affect everything.
#
[client-server]


#
# This group is read by the standalone daemon and embedded servers.
#
[server]


#
# This group is only for embedded server.
#

[embedded]


#
# This group is read by the server.
#
[mysqld]

# Basic configuration
port=3306
server_id=0

datadir=/var/lib/mysql
tmpdir=/var/lib/mysqltmp
socket=/var/lib/mysql/mysql.sock
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

# Logging
log_error=/var/log/mysqld-error.log
slow_query_log=ON
slow_query_log_file=/var/log/mysqld-slow.log
general_log=OFF
general_log_file=/var/log/mysqld-general.log

# Remove leading # and set to the amount of RAM for the most important data cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%. Default is 128M.
#innodb_buffer_pool_size = 128M

# Set the number of open tables. This has a huge effect on memory usage. Default value is 2000.
#table_open_cache=2000

# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
#log_bin

# Optionally change the SQL mode.
#sql_mode=ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION

# Remove leading # to set options mainly useful for reporting servers. The server defaults are faster for transactions and fast SELECTs. Adjust sizes as needed, experiment to find the optimal values.
#join_buffer_size = 128M
#sort_buffer_size = 2M
#read_rnd_buffer_size = 2M

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
EOF

	systemctl start mysqld.service

	local dbrootpass=`cat /var/log/mysqld-error.log | grep -i 'temporary password' | sed 's/.* temporary password is generated for //' | awk '{ print $2 }'`
	cat >/root/.my.cnf <<EOF
[client]
user=root
password="${dbrootpass}"
EOF

	# reset root password (round 1)
	#
	# NOTE: MySQL will not allow you to perform certain operations (such as modify plugins) until the root password has been changed.
	# We're going to disable the validate_password plugin because the default strength requirement is overkill for our images. In order to do that, we must first use a root password that satisfies the validate_password algo.
	echo "resetting MySQL root password (round 1)..."

	local dbrootpass="Lundgren123!"
	/usr/bin/mysqladmin --defaults-file=/root/.my.cnf -u root password "${dbrootpass}"
	cat >/root/.my.cnf <<EOF
[client]
user=root
password="${dbrootpass}"
EOF

	echo "done resetting MySQL root password (round 1)."

	# secure installation
	echo "securing MySQL installation..."
	mysql_secure_installation --use-default
	mysql -e 'uninstall plugin validate_password;'
	echo "done securing MySQL installation..."

	# reset root password (round 2)
	echo "resetting MySQL root password (round 2)..."

	local dbrootpass="`< /dev/urandom /usr/bin/tr -dc A-Za-z0-9 | /usr/bin/head -c15`"
	/usr/bin/mysqladmin --defaults-file=/root/.my.cnf -u root password "${dbrootpass}"
	cat >/root/.my.cnf <<EOF
[client]
user=root
password="${dbrootpass}"
EOF

	echo "done resetting MySQL root password (round 2)."

	# disable service
	echo "shutting down MySQL..."

	systemctl stop mysqld.service
}

function centos7_install_php74
{
	yum -y install php74-cli php74-common php74-gd php74-mbstring php74-mysqlnd \
	php74-opcache php74-pdo php74-xmlrpc php74-bcmath php74-gmp php74-xml php74-process \
	pear1u php74-pecl-imagick php74-pecl-redis php74-pecl-xdebug php74-json php74-fpm

	echo "7.3" > /var/lib/vultr/config/php_ver

	systemctl stop php-fpm.service
	systemctl disable php-fpm.service
}

function centos7_install_php80
{
	yum -y install php80-cli php80-common php80-gd php80-mbstring php80-mysqlnd \
	php80-opcache php80-pdo php80-xmlrpc php80-bcmath php80-gmp php80-xml php80-process \
	pear1u php80-pecl-imagick php80-pecl-redis php80-pecl-xdebug php80-json php80-fpm

	echo "7.3" > /var/lib/vultr/config/php_ver

	systemctl stop php-fpm.service
	systemctl disable php-fpm.service
}

function centos7_configure_php
{
	pushd /etc/
	mkdir -p /var/default-conf/php
	cp php.ini /var/default-conf/php
	sed -i -e "s/^post_max_size.*/post_max_size = 2G/" php.ini
	sed -i -e "s/^upload_max_filesize.*/upload_max_filesize = 2G/" php.ini
	sed -i -e "s/^;date.timezone =.*/date.timezone = UTC/" php.ini
	popd

	sed -i -e "s/^zend_extension=\(.*\)/;zend_extension=\1/" /etc/php.d/15-xdebug.ini
	chattr +i /etc/php.d/15-xdebug.ini

	# backup default conf
	mkdir -p /var/default-conf/php-fpm.d
	cp -a /etc/php-fpm.d/* /var/default-conf/php-fpm.d

	# setup sessions
	# 21069: php-fpm updates will revert ownership changes on the default session folders. we're going to use a custom session folder instead.
	mkdir -p /var/lib/session
	chown root:php-fpm /var/lib/session
	chmod 770 /var/lib/session
	sed -i -e 's/^php_value\[session.save_path\].*/php_value[session.save_path]    = \/var\/lib\/session\//' /etc/php-fpm.d/www.conf
}



################################################################
# Ubuntu Unique Functions
################################################################

function ubuntu_install_nginx
{
	# from https://nginx.org/en/linux_packages.html#Ubuntu
	echo "deb [arch=amd64] http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list
	curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
	apt-key fingerprint ABF5BD827BD9BF62
	apt update
	apt install -y nginx

    cat <<EOF > /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 2000;
}

http {
        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        server_tokens off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        gzip on;

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}
EOF

	systemctl stop nginx.service
	systemctl disable nginx.service
}



function ubuntu_install_cockpit
{
	apt install -y cockpit cockpit-ssh cockpit-storaged cockpit-networkmanager cockpit-users cockpit-tuned cockpit-shell cockpit-doc cockpit-packagekit

	get_var cockpituser
    cockpituser="cockpit${cockpituser}"
	get_var cockpitpass

	ip=${1}
    port=${2}

	sed -i -e "s/9090/${port}/g" /lib/systemd/system/cockpit.socket
    sed -i -e "s/{{PORT}}/${port}/g" /root/app_binaries/cockpit.conf

    mkdir -p /etc/nginx/htpasswd
    htpasswd -b -s -c /etc/nginx/htpasswd/cockpit ${cockpituser} ${cockpitpass}

	mv /root/app_binaries/cockpit.conf /etc/nginx/sites-available/cockpit.conf
    ln -s /etc/nginx/sites-available/cockpit.conf /etc/nginx/sites-enabled/cockpit.conf

	echo '[WebService]' >> /etc/cockpit/cockpit.conf
	echo "Origins = https://${ip}:9080 wss://${ip}:9080" >> /etc/cockpit/cockpit.conf
	echo 'ProtocolHeader = X-Forwarded-Proto' >> /etc/cockpit/cockpit.conf
	echo 'AllowUnencrypted = true' >> /etc/cockpit/cockpit.conf

    ufw allow 9080/tcp

	systemctl stop cockpit.socket
	systemctl disable cockpit.socket
}

function ubuntu_install_php80
{
	echo "8.0" > /etc/vultr/phpver

	add-apt-repository -y ppa:ondrej/php
	apt update
	apt-get -y install php8.0-cli php8.0-common php8.0-gd php8.0-mbstring php8.0-mysql php8.0-opcache \
	php8.0-xmlrpc php8.0-bcmath php8.0-gmp php8.0-xml php8.0-json php8.0-intl php8.0-soap php8.0-dom \
	php8.0-bz2 php8.0-curl php8.0-zip php8.0-sqlite3 php8.0-igbinary php8.0-imagick php8.0-redis php8.0-xdebug hp8.0-fpm

	systemctl stop php8.0-fpm.service
	systemctl disable php8.0-fpm.service
}

function ubuntu_install_php74
{
	echo "7.4" > /etc/vultr/phpver
	add-apt-repository -y ppa:ondrej/php
	apt update

	apt-get -y install php7.4-cli php7.4-common php7.4-gd php7.4-mbstring php7.4-mysql php7.4-opcache \
	php7.4-xmlrpc php7.4-bcmath php7.4-gmp php7.4-xml php7.4-json php7.4-intl php7.4-soap php7.4-dom \
	php7.4-bz2 php7.4-curl php7.4-zip php7.4-sqlite3 php7.4-igbinary php7.4-imagick php7.4-redis php7.4-xdebug php7.4-fpm

	mkdir -p /var/default-conf/php-fpm
	cp -ar /etc/php/7.4/fpm/* /var/default-conf/php-fpm/

	systemctl stop php7.4-fpm.service
	systemctl disable php7.4-fpm.service
}


function ubuntu_configure_php
{
	PHPVER="$(cat /etc/vultr/phpver)"

	mkdir -p /var/default-conf/php-fpm
	cp -ar /etc/php/${PHPVER}/fpm/* /var/default-conf/php-fpm/

	pushd /etc/php/${PHPVER}/fpm/pool.d/

	sed -i -e "s/^listen = \/run\/.*/listen = 127.0.0.1:9000/" www.conf

	# reuse the user/group policy from CentOS
	sed -i -e "s/^user =.*/user = www-data/" www.conf
	sed -i -e "s/^group =.*/group = www-data/" www.conf

	# reuse the session folder structure from CentOS ( originally #21069 )
	mkdir -p /var/lib/session
	chown www-data:www-data /var/lib/session
	chmod 770 /var/lib/session

	echo '' >>www.conf
	echo 'php_admin_value[post_max_size] = 2G' >>www.conf
	echo 'php_admin_value[upload_max_filesize] = 2G' >>www.conf
	echo 'php_admin_value[date.timezone] = UTC' >>www.conf
	echo 'php_admin_value[error_log] = /var/log/php-fpm/www-error.log' >>www.conf
	echo 'php_admin_value[session.save_path] = /var/lib/session' >>www.conf
	echo 'php_admin_flag[log_errors] = on' >>www.conf
	echo '' >>www.conf

	mkdir -p /var/log/php-fpm
	touch /var/log/php-fpm/www-error.log
	chown -R www-data:www-data /var/log/php-fpm

	popd
}

function ubuntu_install_mariadb
{
	# install
	echo "installing MySQL..."

	local dbrootpass="$(/usr/bin/tr </dev/urandom -dc A-Za-z0-9 | /usr/bin/head -c15)"
	echo -n "mysql-server-5.7 mysql-server/root_password password ${dbrootpass}" | debconf-set-selections
	echo -n "mysql-server-5.7 mysql-server/root_password_again password ${dbrootpass}" | debconf-set-selections
	apt-get -y install mariadb-server

	cat >/root/.my.cnf <<EOF
[client]
user=root
password=${dbrootpass}
EOF

	echo "done installing MySQL."

	echo "securing MySQL installation..."

	# Make sure that NOBODY can access the server without a password
	mysql -e "UPDATE mysql.user SET Password = PASSWORD('${dbrootpass}') WHERE User = 'root'"
	# Kill the anonymous users
	mysql -e "DROP USER ''@'localhost'"
	# Because our hostname varies we'll use some Bash magic here.
	mysql -e "DROP USER ''@'$(hostname)'"
	# Kill off the demo database
	mysql -e "DROP DATABASE test"
	# Make our changes take effect
	mysql -e "FLUSH PRIVILEGES"
	# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param
	echo "done securing MySQL installation..."

	# backup default confs
	mkdir -p /var/default-conf/mysql
	cp /etc/mysql/mariadb.cnf /var/default-conf/mariadb

	pushd /etc/mysql/mariadb.conf.d/
	echo '#' >>mysqld.cnf
	echo '# * Cloud Provider Settings' >> 60-vultr.cnf
	echo '#' >>60-vultr.cnf
	echo '#' >>60-vultr.cnf
	echo '# Remove leading # and set to the amount of RAM for the most important data cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%. Default is 128M.' >>mysqld.cnf
	echo '#innodb_buffer_pool_size = 128M' >>60-vultr.cnf
	echo '#' >>60-vultr.cnf
	echo '# Set the number of open tables. This has a huge effect on memory usage. Default value is 2000.' >>60-vultr.cnf
	echo '#table_open_cache=2000' >>60-vultr.cnf
	popd

	# disable service
	echo "shutting down MySQL..."

	systemctl stop mariadb.service
	systemctl disable mariadb.service

	echo "done shutting down MySQL."
}

# configures memory usage settings for mysql in my.cnf
# param string mysql_innodb_buffer_pool_size
# param string mysql_table_open_cache
function ubuntu_configure_mariadb
{
	if [ "$1" != "0" ]; then
		sed -i -e "s/.*innodb_buffer_pool_size.*/innodb_buffer_pool_size=$1/" /etc/mysql/mariadb.conf.d/60-vultr.cnf
	fi

	if [ "$2" != "0" ]; then
		sed -i -e "s/.*table_open_cache.*/table_open_cache=$2/" /etc/mysql/mariadb.conf.d/60-vultr.cnf
	fi

	local dbrootpass="$(/usr/bin/tr </dev/urandom -dc A-Za-z0-9 | /usr/bin/head -c15)"
	local match=$(cat /root/.my.cnf 2>/dev/null | grep -i password | wc -l)

	if [ "$match" = "0" ]; then
		/usr/bin/mysqladmin -u root --password="" password "${dbrootpass}"
	else
		/usr/bin/mysqladmin --defaults-file=/root/.my.cnf -u root password "${dbrootpass}"
	fi

	if [ "$?" = "0" ]; then
		echo "MySQL root password updated."
		cat >/root/.my.cnf <<EOF
[client]
user=root
password=${dbrootpass}
EOF
	else
		echo "ERROR: Could not configure root login."
	fi
}

function ubuntu_install_xhprof
{
	# Install repo
	PHPVER=$(cat /etc/vultr/phpver)
	echo 'deb http://s3-eu-west-1.amazonaws.com/tideways/packages debian main' | tee /etc/apt/sources.list.d/tideways.list
	wget -qO - https://s3-eu-west-1.amazonaws.com/tideways/packages/EEB5E8F4.gpg | apt-key add -
	apt-get update-y

	# Install
	apt-get install -y tideways-php tideways-daemon php${PHPVER}-mysqli php${PHPVER}-json

	ln -s /etc/php/${PHPVER}/mods-available/tideways.ini /etc/php/${PHPVER}/fpm/conf.d/tideways-xhprof.ini
	ln -s /etc/php/${PHPVER}/mods-available/tideways.ini /etc/php/${PHPVER}/cli/conf.d/tideways-xhprof.ini
}

function ubuntu_install_phpmyadmin
{
	PHPVER=$(cat /etc/vultr/phpver)

	# Install requirements for PHPMyAdmin
	apt install -y php-dev libmcrypt-dev php-pear mcrypt make
	y | pecl install mcrypt
	echo extension=mcrypt.so >/etc/php/${PHPVER}/mods-available/mcrypt.ini

	# Add the PHPMyAdmin PPA
	add-apt-repository ppa:phpmyadmin/ppa
	apt-get -y update

	# Install our phpmyadmin
	export DEBIAN_FRONTEND=noninteractive
	apt-get -yq install phpmyadmin

	ln -s /etc/php/${PHPVER}/mods-available/mcrypt.ini /etc/php/${PHPVER}/fpm/conf.d/mcrypt.ini
	ln -s /etc/php/${PHPVER}/mods-available/mcrypt.ini /etc/php/${PHPVER}/cli/conf.d/mcrypt.ini
	ln -s /usr/share/phpmyadmin /var/www/html/mysqladmin
}



################################################################
# Common RHEL Functions
################################################################

function rhel_install_common
{
	cat <<EOF > /etc/yum.repos.d/vultr-apprepo.repo
[apprepo]
name=apprepo
baseurl=https://apprepo.vultr.com/rhel/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-apprepo
EOF
	echo "${APPREPO_KEY}" > /etc/pki/rpm-gpg/RPM-GPG-KEY-apprepo
	yum group install "Development Tools" -y
	yum install -y vim man wget unzip curl yum-utils ethtool cmake pkg-config libglvnd-devel mesa-libGL-devel \
	zlib kernel-devel kernel-headers
	if [ $(which update-crypto-policies) != "" ]; then
		update-crypto-policies --set DEFAULT:SHA1 || true
	fi
}



################################################################
# Common Deb Functions
################################################################

function deb_install_common
{
	# Ubuntu uses a different package name
	HEADERS="linux-headers-amd64"
	if [[ "$(cat /etc/os-release)" == *"Ubuntu"* ]]; then
		HEADERS="linux-headers-generic "
	fi

	# Install packages
	apt-get install -y vim man wget unzip curl gnupg2 ca-certificates lsb-release apache2-utils ethtool \
	build-essential zlib1g cmake pkg-config libglvnd-dev libegl1 libopenblas-dev liblapack-dev ${HEADERS} linux-headers-$(uname -r)

	OS="debian"
	if [ "$(cat /etc/os-release | grep ubuntu)" != "" ]; then
		OS="ubuntu"
	fi

	echo "deb [signed-by=/usr/share/keyrings/vultr-apprepo.gpg] https://apprepo.vultr.com/${OS} universal main" > /etc/apt/sources.list.d/vultr-apprepo.list
	echo "${APPREPO_KEY}" | gpg --dearmor > /usr/share/keyrings/vultr-apprepo.gpg
	apt update -y
}



################################################################
# Common Functions
################################################################

# populates a global variable with an app variable from the VM
# param string variable
# param string vm_path (optional)
function get_var
{
	if [ "$2" != "" ]; then
		local val="`curl http://169.254.169.254/$2 2>/dev/null`"
	else
		local val="`curl -H \"Metadata-Token: vultr\" http://169.254.169.254/v1/internal/app-$1 2>/dev/null`"
	fi

	if [ "$val" = "" ]; then
		echo "Cannot poll variable: $1"
		exit 255
	fi

	local __result=$1
	eval $__result="'$val'"
}

# populates a global variable with an optional app variable from the VM
# param string variable
# param string vm_path (optional)
function get_var_opt
{
	if [ "$2" != "" ]; then
		local val="`curl http://169.254.169.254/$2 2>/dev/null`"
	else
		local val="`curl -H \"Metadata-Token: vultr\" http://169.254.169.254/v1/internal/app-$1 2>/dev/null`"
	fi

	local __result=$1
	eval $__result="'$val'"
}

function generate_certs
{
    pushd /etc/nginx/ssl
    openssl req -subj "/CN=localhost" -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout ${1}.key -out ${1}.crt
    popd
    chmod -R 600 /etc/nginx/ssl
}

function get_os
{
	if [ "$(grep "CentOS Linux 7" /etc/os-release | wc -l)" != "0" ]; then
		echo "centos7"
		return
	fi
	if [ "$(grep "Ubuntu" /etc/os-release | wc -l)" != "0" ]; then
		echo "ubuntu"
		return
	fi
	if [ "$(which pacman)" != "" ]; then
		echo "archlinux"
		return
	fi
}

function get_flavor
{
	if [ "$(which apt)" != "" ]; then
		echo "deb"
		return
	fi
	if [ "$(which yum)" != "" ]; then
		echo "rhel"
		return
	fi
	if [ "$(which pacman)" != "" ]; then
		echo "archlinux"
		return
	fi
}

function get_ip
{
	get_var ip "meta-data/meta-data/public-ipv4"
}

function cockpit_gitlab_fix() {
	sed -i -e 's/9090/9091/g' /lib/systemd/system/cockpit.socket
	systemctl daemon-reload
}

function cleanup_imageless
{
    rm -rf /root/app_binaries
}

function imgboot_exit
{
	if [ "$1" == 0 ]; then
		rm -rf /opt/imageboot
	fi
	exit $1
}

function install_cudnn {
	mkdir -p /cudnn
	pushd /cudnn
	curl -L "${CUDNN_DRIVER_URL}" | tar -xvj
	mkdir -p /usr/local/cuda/include
	mkdir -p /usr/local/cuda/lib_cuda
	ln -s /usr/local/cuda/lib_cuda /usr/local/cuda/lib
	ln -s /usr/local/cuda/lib_cuda /usr/local/cuda/lib64
	mv -f include/* /usr/local/cuda/include
	mv -f lib/* /usr/local/cuda/lib_cuda
	chmod a+r /usr/local/cuda/include/* /usr/local/cuda/lib64/*
	popd
	rm -rf /cudnn
	cat <<ENDFILE > /etc/ld.so.conf.d/cudnn.conf
/usr/local/cuda/lib64
ENDFILE
	ldconfig
}



################################################################
# Dynamic functions
################################################################

function install_nginx
{
	case "$(get_os)" in
	"centos7")
		centos7_install_nginx
		;;

	"ubuntu")
		ubuntu_install_nginx
		;;

	*)
		echo "Invalid OS Selection!"
		exit 255
		;;
	esac
}

function install_php74
{
	case "$(get_os)" in
	"centos7")
		centos_install_php74
		centos_configure_php
		;;

	"ubuntu")
		ubuntu_install_php74
		ubuntu_configure_php
		;;

	*)
		echo "Invalid OS Selection!"
		exit 255
		;;
	esac
}

function install_php80
{
	case "$(get_os)" in
	"centos7")
		centos_install_php80
		centos_configure_php
		;;

	"ubuntu")
		ubuntu_install_php80
		ubuntu_configure_php
		;;

	*)
		echo "Invalid OS Selection!"
		exit 255
		;;
	esac
}

function install_mysql
{
	case "$(get_os)" in
	"centos7")
		centos7_install_mysql57
		;;

	"ubuntu")
		ubuntu_install_mariadb
		;;

	*)
		echo "Invalid OS Selection!"
		exit 255
		;;
	esac
}

# param string mysql_innodb_buffer_pool_size
# param string mysql_table_open_cache
function configure_mysql
{
	case "$(get_os)" in
	"centos7")
		centos7_install_mysql57
		centos7_configure_mysql57 $@
		;;

	"ubuntu")
		ubuntu_install_mariadb
		ubuntu_configure_mariadb $@
		;;

	*)
		echo "Invalid OS Selection!"
		exit 255
		;;
	esac
}

function install_common
{
	case "$(get_flavor)" in
	"rhel")
		rhel_install_common
		;;

	"deb")
		deb_install_common
		;;
	*)
		echo "No packages selected!"
		;;
	esac

	mkdir -p /opt/vultr/

	ln -s /var/lib/vultr/vultr_app.sh /opt/vultr/vultr_app.sh
	echo "" >> ~/.bashrc
	echo ". /opt/vultr/vultr_app.sh" >> ~/.bashrc
	. /var/lib/vultr/vultr_app.sh

	# Setup log reader
	touch /var/log/cloud-init.log
	LINE="============================================="
	echo -e "${LINE}\nPress Q to quit less and refresh this log!\n${LINE}\n$(cat /var/log/cloud-init.log)" > /var/log/cloud-init.log
	systemctl enable --now /var/lib/vultr/config/cloud-init-log-reader.service

	# Blacklist nouveau
	if [ -d /etc/modprobe.d ]; then
		cat <<EOF > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF
	fi

	# Instal CuDNN
	install_cudnn

	# Secure against empty hostname bug
	mkdir -p /var/lib/cloud/data/
	cat <<EOF > /var/lib/cloud/data/set-hostname
{
 "fqdn": "guest.domain.com",
 "hostname": "guest"
}
EOF
}
