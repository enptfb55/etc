# Filename:      ~/dotfiles/xinitrc
# Last modified: 2016.02.22

# disable bell
xset -b

xrdb -merge ${HOME}/.Xresources
xmodmap ${HOME}/.Xmodmap

# start i3 and capture logs
echo "starting at $(date)" >> ${HOME}/.logs/i3.log
exec i3 -V -d all >> ${HOME}/.logs/i3.log
