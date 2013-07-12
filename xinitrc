#!/bin/sh

# Filename:          ~/dotfiles/xinitrc
# Last modified:     2013 06 27

user_resources=$HOME/dotfiles/xresources
user_modmap=$HOME/dotfiles/xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

xrdb -merge $user_resources
xmodmap $user_modmap

case "$1" in
    kde)        exec startkde ;;
    openbox)    exec openbox-session ;;
    xfce*)      exec xfce4-session ;;
    *)          exec xfce4-session ;;
esac
