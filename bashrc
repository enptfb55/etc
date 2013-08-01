# Filename:         ~/dotfiles/bashrc
# Last modified:    2013.07.31

source $HOME/dotfiles/bash_aliases

export EDITOR=vim
export LS_COLORS="no=00:fi=00:di=00;96:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"
export PATH=$HOME/bin:$HOME/local/bin:/opt/bin:$PATH:/sbin
export PS1='[\u@\h \W$(__git_ps1 " (\[\e[00;32m\]%s\[\e[0;37m\])")]\$ '

# Internationalization variables.
# export LC_ALL="en_US.UTF-8"     # Set all language vars to UTF-8 US English.
export LC_COLLATE="C"           # Sort file listings with directories and dotfiles first.

# Enable Oxygen (and other) themes in Qt.
export QT_PLUGIN_PATH=$HOME/.kde/lib/kde4/plugins/:/usr/lib/kde4/plugins/:/usr/lib/qt/plugins/:/usr/lib/qt4/plugins

# Hack to get download icons in chromium
export KDE_FULL_SESSION=true
export KDE_SESSION_VERSION=4



# Ignore certain file types in tab-completion
FIGNORE='.o:.class:.pyc'

# Map caps lock to escape
/usr/bin/xmodmap ~/dotfiles/xmodmap &> /dev/null

# Allow su to root to use $DISPLAY
if [[ -n $DISPLAY ]]; then
    xhost local:root > /dev/null
fi

# Store python interpreter history.
export PYTHONSTARTUP=$HOME/dotfiles/pystartup

# TODO: Is this needed? Load custom X config.
xrdb -merge ~/dotfiles/xresources

