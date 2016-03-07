#!/usr/bin/env bash
# Filename:      etc/bootstrap.sh
# Last modified: 2016.03.06

# After cloning the etc.git repo into ${HOME}, this script will create the
# necessary directory structure and symlinks.

set -o errexit -o nounset -o pipefail


function main()
{
    local cmd_mkdir=$(get_cmd_mkdir $(uname -s))
    local cmd_ln=$(get_cmd_ln $(uname -s))

    [[ -z ${HOME} ]]      && echo error: HOME is not set && exit 1
    [[ -z ${cmd_mkdir} ]] && echo error: Could not determine appropriate mkdir command && exit 1
    [[ -z ${cmd_ln} ]]    && echo error: Could not determine appropriate ln command && exit 1

    ${cmd_mkdir} ${HOME}/bin
    ${cmd_mkdir} ${HOME}/src
    ${cmd_mkdir} ${HOME}/var
    ${cmd_mkdir} ${HOME}/var/log
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

    confirm "hushlogin?" \
        && touch ${HOME}/.hushlogin \
        && echo " [installed]"

    confirm "i3?" \
        && ${cmd_mkdir} ${HOME}/var/log \
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
        && ${cmd_ln} ${HOME}/etc/top/toprc ${HOME}/.toprc \
        && echo " [installed]"

    confirm "tmux?" \
        && ${cmd_mkdir} ${HOME}/etc/tmux/plugins \
        && install_tmux_plugins \
        && echo " [installed]"

    confirm "vim?" \
        && ${cmd_ln} ${HOME}/etc/vim ${HOME}/.vim \
        && ${cmd_mkdir} ${HOME}/.vim/bundle \
        && ${cmd_mkdir} ${HOME}/var/vim \
        && install_vim_plugins \
        && echo " [installed]"

} # main()


function confirm()
{
    read -n 1 -r -p "${1:-Are you sure? [y/N]} " response
    case ${response} in
    y) return 0 ;;
    *)
        if [[ ${response} ]]; then
            echo
        fi
        return -1 ;;
    esac

}


function get_cmd_mkdir()
{
    (( "$#" != 1 )) && return 1

    case $1 in

    Linux)
        echo "mkdir --mode=0700 --parents"
        ;;

    Darwin)
        # if mkdir supports the --version option, it's GNU mkdir
        if mkdir --version &> /dev/null; then
            echo "mkdir --mode=0700 --parents"
        else
            echo "mkdir -m 0700 -p"
        fi
        ;;

    *)
        return 1
        ;;

    esac

    return 0
}


function get_cmd_ln()
{
    (( "$#" != 1 )) && return 1

    case $1 in

    Linux)
        echo "ln --force --no-dereference --relative --symbolic"
        ;;

    Darwin)
        # if ln supports the --version option, it's GNU ln
        if ln --version &> /dev/null; then
            echo "ln --force --no-dereference --relative --symbolic"
        else
            echo "ln -fhs"
        fi
        ;;

    *)
        return 1
        ;;

    esac

    return 0
}


function install_vim_plugins()
{
    git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim &> /dev/null
    vim -e +PluginInstall +qall &> /dev/null
    return 0
}


function install_tmux_plugins()
{
    git clone https://github.com/tmux-plugins/tpm ${HOME}/etc/tmux/plugins/tpm &> /dev/null
    ${HOME}/etc/tmux/plugins/tpm/bin/update_plugins all &> /dev/null
}


main
