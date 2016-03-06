#!/usr/bin/env bash
# Filename:      etc/symlink.sh
# Last modified: 2016.03.05

# After cloning the etc.git repo into ${HOME}, this script will create the
# necessary directory structure and symlinks.

function main()
{
    local cmd_mkdir="mkdir --mode=0700 --parents"
    local cmd_ln="ln --force --relative --symbolic"
    local cmd_ln_dir="ln --force --no-dereference --relative --symbolic"

    ${cmd_mkdir} ${HOME}/var/xauthority

    confirm "bash?" \
        && ${cmd_ln} ${HOME}/etc/bash/bash_profile ${HOME}/.bash_profile \
        && ${cmd_ln} ${HOME}/etc/bash/bashrc ${HOME}/.bashrc \
        && ${cmd_mkdir} ${HOME}/var/bash \
        && ${cmd_mkdir} ${HOME}/var/less \
        && ${cmd_mkdir} ${HOME}/var/python \
        && echo " [installed]"

    confirm "git?" \
        && ${cmd_mkdir} ${HOME}/.config/git \
        && ${cmd_ln} ${HOME}/etc/git/config ${HOME}/.config/git/config \
        && echo " [installed]"

    confirm "htop?" \
        && ${cmd_mkdir} ${HOME}/.config/htop \
        && ${cmd_ln} ${HOME}/etc/htop/htoprc ${HOME}/.config/htop/config \
        && echo " [installed]"

    # confirm "hushlogin?" \
    #     && ${cmd_ln} ${HOME}/dotfiles/hushlogin ${HOME}/.hushlogin \
    #     && echo " [installed]"

    confirm "i3?" \
        && ${cmd_mkdir} ${HOME}/.config/i3 \
        && ${cmd_mkdir} ${HOME}/.config/i3status \
        && ${cmd_ln} ${HOME}/etc/i3/config ${HOME}/.config/i3/config \
        && ${cmd_ln} ${HOME}/etc/i3status/config ${HOME}/.config/i3status/config \
        && echo " [installed]"

    confirm "locate?" \
        && ${cmd_mkdir} ${HOME}/var/cache/mlocate \
        && echo " [installed]"

    confirm "lftp?" \
        && ${cmd_mkdir} ${HOME}/.config/lftp \
        && ${cmd_ln} ${HOME}/etc/lftp/rc ${HOME}/.config/lftp/rc \
        && echo " [installed]"

    confirm "top?" \
        && ${mkdir_ln} ${HOME}/etc/top/toprc ${HOME}/.toprc \
        && echo " [installed]"

    confirm "vim?" \
        && ${cmd_mkdir} ${HOME}/.vim/bundle \
        && ${cmd_ln_dir} ${HOME}/etc/vim ${HOME}/.vim \
        && echo " [installed]"

    confirm "xinit?" \
        && ${LN} ${HOME}/dotfiles/xinitrc ${HOME}/.xinitrc \
        && echo " [installed]"

    confirm "xmodmap?" \
        && ${LN} ${HOME}/dotfiles/Xmodmap ${HOME}/.Xmodmap \
        && echo " [installed]"

    confirm "xresources?" \
        && ${LN} ${HOME}/dotfiles/Xresources ${HOME}/.Xresources \
        && echo " [installed]"
} # main()


function confirm()
{
    read -n 1 -r -p "${1:-Are you sure? [y/N]} " response
    case ${response} in
    y) true ;;
    *)
        if [[ ${response} ]]; then
            echo
        fi
        false ;;
    esac
}



main
