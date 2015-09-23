#!/bin/bash
yum -y update
yum -y install mc
yum -y install wget
yum -y install psmisc
yum -y groupinstall "Development Tools"
cd /usr/src
wget http://nodejs.org/dist/v4.1.0/node-v4.1.0.tar.gz
tar zxf node-v4.1.0.tar.gz
rm -f ./node-v4.1.0.tar.gz
cd node-v4.1.0
./configure
make
make install
cd ~
rm -rf /usr/src/node-v4.1.0
ln -s /usr/local/bin/node /bin
ln -s /usr/local/bin/npm /bin
cat >/etc/yum.repos.d/mongodb.repo <<EOL
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOL
yum -y install mongo-10gen mongo-10gen-server
service mongod start
chkconfig mongod on
mkdir /impress
cd /impress
npm install mongodb
npm install nodemailer
npm install websocket
npm install geoip-lite
npm install impress
