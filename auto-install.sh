#!/bin/bash

set -ex

prj_dir=`dirname $0`
sudo $prj_dir/bootstrap.sh

echo "install zsh/ack/ag/git"
sudo apt-get install zsh -y
sudo apt-get install ack-grep silversearcher-ag -y

echo "clone https://github.com/byrne/linux-env.git and install"
$prj_dir/install-minimal.sh
sudo chsh -s /bin/zsh 

echo "install done, please logout & vagrant ssh"
