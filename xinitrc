#!/usr/bin/env bash

# Filename:          ~/dotfiles/xinitrc
# Last modified:     2015.12.05

user_resources=${HOME}/.Xresources
user_modmap=${HOME}/.xmodmap
sys_resources=/etc/X11/xinit/.Xresources
sys_modmap=/etc/X11/xinit/.Xmodmap

xrdb -merge ${user_resources}
xmodmap ${user_modmap}

exec i3
