# Filename:      ~/dotfiles/profile
# Last modified: 2016.02.21
# This should contain environment variables not specific to any shell.


# set vim as default editor
export EDITOR=vim

# sort file listings with directories and dotfiles first.
export LC_COLLATE="C"

# set up default path and manpath
export PATH=${HOME}/local/bin:${PATH}:/sbin
export MANPATH=${HOME}/local/man:${MANPATH}

# change default location of the Xauthority file
export XAUTHORITY=/tmp/xauthority-${USER}

