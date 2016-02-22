#!/usr/bin/env sh

# Filename:      ~/dotfiles/profile
# Last modified: 2016.02.21
# This should contain environment variables not specific to any shell.

echo "+++ .profile"

# set vim as default editor
export EDITOR=vim

# sort file listings with directories and dotfiles first.
export LC_COLLATE="C"

# set up default path and manpath
case $(uname -s) in
    "Linux")
        PATH=${HOME}/local/bin:${PATH}:/sbin
        MANPATH=${HOME}/local/man:${MANPATH}
        ;;
    "Darwin")
        PATH=${HOME}/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:${PATH}
        MANPATH=${HOME}/local/man:/usr/local/opt/coreutils/libexec/gnuman:/usr/local/share/man:${MANPATH}
        ;;
    *)
        echo ".profile: Unknown OS"
        exit 1
        ;;
esac

# change default location of the Xauthority file
export XAUTHORITY=/tmp/xauthority-${USER}

export MANPATH PATH
