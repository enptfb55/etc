# Filename:      ~/dotfiles/bash_profile
# Last modified: 2016.02.21
# This is only executed for login shells. Simply load .profile and .bashrc.

echo "+++ .bash_profile"


if [[ -f "${HOME}/.profile" ]]; then
    . "${HOME}/.profile"
fi


if [[ -f "${HOME}/.bashrc" ]]; then
    . "${HOME}/.bashrc"
fi
