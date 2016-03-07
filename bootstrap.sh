#!/usr/bin/env bash
# Filename:      etc/bootstrap.sh
# Last modified: 2016.03.06
# After cloning the etc.git repo into ${HOME}, this script will create the
# necessary directory structure and symlinks.

set -o nounset -o pipefail

# set up logging so that stdout and stderr go to a log file
# note: to print only to console (original stdout), use echo "hello" 1>&3
readonly LOG="${HOME}/var/log/bootstrap.log"
exec 3>&1 1>>${LOG} 2>&1

function log_debug() { echo "[$(date +'%Y.%m.%d %H:%M:%S%z')] [$$] [DEBUG] $@" >&2 ; }
function log_info()  { echo "[$(date +'%Y.%m.%d %H:%M:%S%z')] [$$] [INFO ] $@" >&2 ; }
function log_error() { echo "[$(date +'%Y.%m.%d %H:%M:%S%z')] [$$] [ERROR] $@" | tee /dev/fd/3 ; }
function log_fatal() { echo "[$(date +'%Y.%m.%d %H:%M:%S%z')] [$$] [FATAL] $@" | tee /dev/fd/3 ; exit 1 ; }


function main()
{
    log_info "$0"

    [[ -z ${HOME:-} ]] && log_error "error: HOME is not set" && exit 1

    create_dir "${HOME}/bin"
    create_dir "${HOME}/src"
    create_dir "${HOME}/var"
    create_dir "${HOME}/var/log"
    create_dir "${HOME}/var/xauthority"

    confirm "bash" \
        && create_symlink "${HOME}/etc/bash/bash_profile" "${HOME}/.bash_profile" \
        && create_symlink "${HOME}/etc/bash/bashrc" "${HOME}/.bashrc" \
        && create_dir "${HOME}/var/bash" \
        && create_dir "${HOME}/var/less" \
        && create_dir "${HOME}/var/python" \
        && echo " [installed]" >&3

    confirm "git" \
        && create_dir "${HOME}/.config/git" \
        && create_symlink "${HOME}/etc/git/config" "${HOME}/.config/git/config" \
        && echo " [installed]" >&3

    confirm "htop" \
        && create_dir "${HOME}/.config/htop" \
        && create_symlink "${HOME}/etc/htop/htoprc" "${HOME}/.config/htop/config" \
        && echo " [installed]" >&3

    confirm "hushlogin" \
        && touch "${HOME}/.hushlogin" \
        && echo " [installed]" >&3

    confirm "i3" \
        && create_dir "${HOME}/var/log" \
        && create_dir "${HOME}/.config/i3" \
        && create_dir "${HOME}/.config/i3status" \
        && create_symlink "${HOME}/etc/i3/config" "${HOME}/.config/i3/config" \
        && create_symlink "${HOME}/etc/i3status/config" "${HOME}/.config/i3status/config" \
        && echo " [installed]" >&3

    confirm "locate" \
        && create_dir "${HOME}/var/cache/mlocate" \
        && echo " [installed]" >&3

    confirm "lftp" \
        && create_dir "${HOME}/.config/lftp" \
        && create_symlink "${HOME}/etc/lftp/rc" "${HOME}/.config/lftp/rc" \
        && echo " [installed]" >&3

    confirm "top" \
        && create_symlink "${HOME}/etc/top/toprc" "${HOME}/.toprc" \
        && echo " [installed]" >&3

    confirm "tmux" \
        && create_dir "${HOME}/etc/tmux/plugins" \
        && install_tmux_plugins \
        && echo " [installed]" >&3

    confirm "vim" \
        && create_symlink "${HOME}/etc/vim" "${HOME}/.vim" \
        && create_dir "${HOME}/.vim/bundle" \
        && create_dir "${HOME}/var/vim" \
        && install_vim_plugins \
        && echo " [installed]" >&3

} # main()


function confirm()
{
    (( "$#" != 1 )) && log_fatal "{confirm} missing argument"

    # prompt user for y/n
    echo -n "$1? " >&3

    # capture response
    read -n 1 -r response

    case ${response} in
    y)                                       return 0 ;;
    *) [[ ! -z ${response} ]] && echo >&3 && return 1 ;;
    esac
}


function create_symlink()
{
    (( "$#" != 2 )) && log_fatal "{create_symlink} missing argument to function"

    case $(uname -s) in

    Linux)
        cmd="ln --force --no-dereference --relative --symbolic"
        ;;

    Darwin)
        # if ln supports the --version option, it's GNU ln
        if ln --version &> /dev/null; then
            cmd="ln --force --no-dereference --relative --symbolic"
        else
            cmd="ln -fhs"
        fi
        ;;

    *)
        log_fatal "{create_symlink} unknown os [$(uname -s)]"
        ;;

    esac

    log_info "{create_symlink} calling [${cmd} "$@"]"

    output=$(${cmd} "$@" 2>&1)
    local readonly exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{create_symlink} exit_status [${exit_status}]"
        log_fatal "{create_symlink} ${output}"
    else
        log_debug "{create_symlink} exit_status [${exit_status}]"
    fi
}


function create_dir()
{
    (( "$#" != 1 )) && log_fatal "{create_dir} missing argument to function"

    # if directory already exists, we have nothing to do
    [[ -d $1 ]] && log_debug "{create_dir} dir [$1] already exists" && return 0

    case $(uname -s) in
    Linux)
        cmd="mkdir --mode=0700"
        ;;

    Darwin)
        # if mkdir supports the --version option, it's GNU mkdir
        if mkdir --version &> /dev/null; then
            cmd="mkdir --mode=0700"
        else
            cmd="mkdir -m 0700"
        fi
        ;;

    *)
        log_fatal "{create_dir} unknown os [$(uname -s)]"
        ;;
    esac

    log_info "{create_dir} calling [${cmd} $1]"

    output=$(${cmd} $1 2>&1)
    local readonly exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{create_dir} exit_status [${exit_status}]"
        log_fatal "{create_dir} ${output}"
    else
        log_debug "{create_dir} exit_status [${exit_status}]"
    fi
}


function install_vim_plugins()
{
    # clone the repo
    local cmd="git clone --quiet https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim"
    log_debug "{install_vim_plugins} calling [${cmd}]"

    local output=$(${cmd} 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{install_vim_plugins} exit_status [${exit_status}]"
        log_fatal "{install_vim_plugins} ${output}"
    else
        log_debug "{install_vim_plugins} output [${output}]"
        log_debug "{install_vim_plugins} exit_status [${exit_status}]"
    fi


    # run vim command to install other plugins
    local cmd="vim -e +PluginInstall +qall"
    log_debug "{install_vim_plugins} calling [${cmd}]"

    local output=$(${cmd} 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{install_vim_plugins} exit_status [${exit_status}]"
        log_fatal "{install_vim_plugins} ${output}"
    else
        log_debug "{install_vim_plugins} output [${output}]"
        log_debug "{install_vim_plugins} exit_status [${exit_status}]"
    fi
}


function install_tmux_plugins()
{
    # clone the repo
    local cmd="git clone --quiet https://github.com/tmux-plugins/tpm ${HOME}/etc/tmux/plugins/tpm"
    log_debug "{install_tmux_plugins} calling [${cmd}]"

    local output=$(${cmd} 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{install_tmux_plugins} exit_status [${exit_status}]"
        log_fatal "{install_tmux_plugins} ${output}"
    else
        log_debug "{install_tmux_plugins} output [${output}]"
        log_debug "{install_tmux_plugins} exit_status [${exit_status}]"
    fi


    # run specific script to install other plugins
    local cmd="${HOME}/etc/tmux/plugins/tpm/bin/install_plugins all"
    log_debug "{install_tmux_plugins} calling [${cmd}]"

    local output=$(${cmd} 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{install_tmux_plugins} exit_status [${exit_status}]"
        log_fatal "{install_tmux_plugins} ${output}"
    else
        log_debug "{install_tmux_plugins} output [${output}]"
        log_debug "{install_tmux_plugins} exit_status [${exit_status}]"
    fi
}


# main entry point
main "$@"
