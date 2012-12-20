#!/bin/bash

cwd=`pwd`

ln -sf $cwd/bashrc $HOME/.bashrc
ln -sf $cwd/profile $HOME/.profile
ln -sf $cwd/gitconfig $HOME/.gitconfig
ln -sf $cwd/tmux.config $HOME/.tmux.conf

