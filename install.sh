#!/bin/bash

cwd=`pwd`

echo "cp $cwd/bashrc $HOME/.bashrc"
cp $cwd/bashrc $HOME/.bashrc

echo "cp $cwd/profile $HOME/.profile"
cp $cwd/profile $HOME/.profile

echo "cp $cwd/gitconfig $HOME/.gitconfig"
cp $cwd/gitconfig $HOME/.gitconfig

echo "cp $cwd/tmux.config $HOME/.tmux.conf"
cp $cwd/tmux.config $HOME/.tmux.conf

#echo "install hosts to /etc/hosts"
#sudo cp /etc/hosts{,_bak} 
#sudo cp $cwd/hosts /etc/hosts
