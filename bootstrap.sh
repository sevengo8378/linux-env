#!/bin/sh

set -ex

echo "Asia/Shanghai" > /etc/timezone
dpkg-reconfigure tzdata

sed -i 's!http://\(.*archive\|security\)\.ubuntu\.com!http://cn.archive.ubuntu.com!' /etc/apt/sources.list
apt-get -y update
apt-get -y dist-upgrade

apt-get -y clean
