# Filename:      ~/dotfiles/profile
# Last modified: 2016.02.24
# This should contain environment variables not specific to any shell.


# set vim as default editor
export EDITOR=vim

# sort file listings with directories and dotfiles first.
export LC_COLLATE="C"

# set up default path and manpath
case ${OSTYPE} in
    "linux-gnu")
        PATH=${HOME}/local/bin:${PATH}:/sbin
        MANPATH=${HOME}/local/man:${MANPATH}
        ;;
    "darwin"*)
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
