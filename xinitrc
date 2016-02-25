# Filename:      ~/dotfiles/xinitrc
# Last modified: 2016.02.24

# disable bell
xset -b

if [ -s ${HOME}/.Xresources ]; then
    xrdb -merge ${HOME}/.Xresources
fi

if [ -s ${HOME}/.Xmodmap ]; then
    xmodmap ${HOME}/.Xmodmap
fi

# allow su to root to use ${DISPLAY}
xhost local:root > /dev/null

# start i3 and capture logs
echo "starting at $(date)" >> ${HOME}/.logs/i3.log
exec i3 -V -d all >> ${HOME}/.logs/i3.log
