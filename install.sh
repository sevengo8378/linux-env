#!/bin/bash

cwd=`pwd`

cp $cwd/bashrc $HOME/.bashrc
cp $cwd/profile $HOME/.profile
cp $cwd/gitconfig $HOME/.gitconfig
cp $cwd/tmux.config $HOME/.tmux.conf

