# Filename:         ~/dotfiles/bashrc
# Last modified:    2013 07 08

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

# Aliases
alias acc='awk '\''{s+=$1} END {print s}'\'''   # Add up all numbers in a column
alias df='df -h'
alias egrep='egrep --color=auto --binary-files=without-match'
alias fgrep='fgrep --color=auto --binary-files=without-match'
alias findx='find . -type f -print0 | xargs -0 grep --line-number --color=auto --binary-files=without-match'
alias findxcpp='find . -type f -and \( -name "*.cpp" -print0 -or -name "*.h" -print0 \) | xargs -0 grep --line-number --color=auto --binary-files=without-match'
alias g='grep --line-number --color=auto --binary-files=without-match'
alias gerp='grep --color=auto --binary-files=without-match'
alias grep='grep --color=auto --binary-files=without-match'
alias gv='gvim -geometry 140x85 -O'
alias gvim='gvim -geometry 140x85 -O'
alias ll='ls -lahF --group-directories-first'
alias l='ls --color=auto --group-directories-first'
alias ls='ls --color=auto --group-directories-first'
alias mount='mount | column -t'
alias nsg='sudo netstat -anp | grep --line-number --color=auto'
alias psg='ps aux | grep -v grep | grep --line-number --color=auto'
alias rm_orig='find . -name "*.orig" -exec rm {} \;'
alias sl='ls --color=auto --group-directories-first'
alias udb='updatedb -l 0 -o $HOME/mlocate.db -U $HOME'
alias vi='vim -O'
alias vim='vim -O'
alias vmi='vim -O'

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

# nvidia-settings -a InitialPixmapPlacement=0
