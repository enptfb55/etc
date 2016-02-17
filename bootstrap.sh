#!/usr/bin/env bash
# Filename:      ~/dotfiles/bootstrap.sh
# Last modified: 2016.02.16

mkdir --parents ${HOME}/.config/htop
mkdir --parents ${HOME}/.i3
mkdir --parents ${HOME}/dotfiles/tmux/plugins
mkdir --parents ${HOME}/dotfiles/vim/bundle

ln --force --symbolic ${HOME}/dotfiles/bash_profile ${HOME}/.bash_profile
ln --force --symbolic ${HOME}/dotfiles/bashrc ${HOME}/.bashrc
ln --force --symbolic ${HOME}/dotfiles/gdbinit ${HOME}/.gdbinit
ln --force --symbolic ${HOME}/dotfiles/gitconfig ${HOME}/.gitconfig
ln --force --symbolic ${HOME}/dotfiles/htoprc ${HOME}/.config/htop/htoprc
ln --force --symbolic ${HOME}/dotfiles/i3config ${HOME}/.i3/config
ln --force --symbolic ${HOME}/dotfiles/i3status.conf ${HOME}/.i3status.conf
ln --force --symbolic ${HOME}/dotfiles/inputrc ${HOME}/.inputrc
ln --force --symbolic ${HOME}/dotfiles/lftprc ${HOME}/.lftprc
ln --force --symbolic ${HOME}/dotfiles/profile ${HOME}/.profile
ln --force --symbolic ${HOME}/dotfiles/tmux.conf ${HOME}/.tmux.conf
ln --force --no-dereference --symbolic ${HOME}/dotfiles/tmux ${HOME}/.tmux
ln --force --no-dereference --symbolic ${HOME}/dotfiles/vim ${HOME}/.vim
ln --force --symbolic ${HOME}/dotfiles/vimrc ${HOME}/.vimrc
ln --force --symbolic ${HOME}/dotfiles/xinitrc ${HOME}/.xinitrc
ln --force --symbolic ${HOME}/dotfiles/Xmodmap ${HOME}/.Xmodmap
ln --force --symbolic ${HOME}/dotfiles/Xresources ${HOME}/.Xresources
