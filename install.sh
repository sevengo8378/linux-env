#!/bin/bash

cwd=`pwd`

# clone some git repositories to $HOME
cd $HOME
git clone git@github.com:byrne/oh-my-zsh.git .oh-my-zsh
git clone git@github.com:byrne/vimfiles.git .vim
ln -sf $HOME/.vim/vimrc.improve $HOME/.vimrc

cd $cwd
echo "cp $cwd/bashrc $HOME/.bashrc"
cp $cwd/bashrc $HOME/.bashrc

echo "cp $cwd/profile $HOME/.profile"
cp $cwd/profile $HOME/.profile

echo "cp $cwd/gitconfig $HOME/.gitconfig"
cp $cwd/gitconfig $HOME/.gitconfig

echo "cp $cwd/tmux.config $HOME/.tmux.conf"
cp $cwd/tmux.config $HOME/.tmux.conf

echo "cp $cwd/zshrc $HOME/.zshrc"
cp $cwd/zshrc $HOME/.zshrc

#echo "install hosts to /etc/hosts"
#sudo cp /etc/hosts{,_bak} 
#sudo cp $cwd/hosts /etc/hosts

is_mac=`uname | grep Darwin`
[ -n $is_mac ] && cp $cwd/show-hide-files ~/bin/

cd $HOME
# switch shell to zsh
chsh -s /bin/zsh
. $HOME/.zshrc

# install homebrew
#ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
