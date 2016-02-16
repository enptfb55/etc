#!/bin/bash
# Filename:      ~/dotfiles/install.sh
# Last modified: 2016.02.16

mkdir -p ${HOME}/.config/htop
mkdir -p ${HOME}/.i3

ln -sf ${HOME}/dotfiles/bash_profile ${HOME}/.bash_profile
ln -sf ${HOME}/dotfiles/bashrc ${HOME}/.bashrc
ln -sf ${HOME}/dotfiles/gdbinit ${HOME}/.gdbinit
ln -sf ${HOME}/dotfiles/gitconfig ${HOME}/.gitconfig
ln -sf ${HOME}/dotfiles/htoprc ${HOME}/.config/htop/htoprc
ln -sf ${HOME}/dotfiles/i3config ${HOME}/.i3/config
ln -sf ${HOME}/dotfiles/i3status.conf ${HOME}/.i3status.conf
ln -sf ${HOME}/dotfiles/inputrc ${HOME}/.inputrc
ln -sf ${HOME}/dotfiles/lftprc ${HOME}/.lftprc
ln -sf ${HOME}/dotfiles/profile ${HOME}/.profile
ln -sf ${HOME}/dotfiles/tmux.conf ${HOME}/.tmux.conf
ln -sfn ${HOME}/dotfiles/vim ${HOME}/.vim
ln -sf ${HOME}/dotfiles/vimrc ${HOME}/.vimrc
ln -sf ${HOME}/dotfiles/xinitrc ${HOME}/.xinitrc
ln -sf ${HOME}/dotfiles/Xmodmap ${HOME}/.Xmodmap
ln -sf ${HOME}/dotfiles/Xresources ${HOME}/.Xresources
