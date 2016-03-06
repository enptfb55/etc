# Filename:      etc/profile
# Last modified: 2016.03.05
# This should set environment variables not specific to any shell. And then
# call the shell-specific profiles.

echo "+++ .profile"


# set vim as default editor
export EDITOR=vim

# sort file listings with directories and dotfiles first.
export LC_COLLATE="C"

# set up default path and manpath
case "${OSTYPE}" in
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

if [ -f etc/bash/bash_profile ]; then
    source etc/bash/bash_profile
fi

# change default location of the Xauthority file
export XAUTHORITY=var/xauthority/xauthority

export MANPATH PATH
