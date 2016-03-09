#!/usr/bin/env bash
# Filename:      etc/bootstrap.sh
# Last modified: 2016.03.08
#
# After cloning the etc.git repo into ${HOME}, this script will create the
# necessary directory structure and symlinks.

set -o errexit -o nounset -o pipefail

# set up logging so that stdout and stderr go to a log file
# note: to print only to console (original stdout), use echo "hello" 1>&3
readonly LOG="${HOME}/var/log/bootstrap.log"
exec 3>&1 1>>"${LOG}" 2>&1

log_debug() { printf "[%s] [%s] [DEBUG] %s\n" "$(date +'%Y.%m.%d %H:%M:%S%z')" "$$" "$@" >&2 ; }
log_info()  { printf "[%s] [%s] [INFO ] %s\n" "$(date +'%Y.%m.%d %H:%M:%S%z')" "$$" "$@" >&2 ; }
log_error() { printf "[%s] [%s] [ERROR] %s\n" "$(date +'%Y.%m.%d %H:%M:%S%z')" "$$" "$@" | tee /dev/fd/3 ; }
log_fatal() { printf "[%s] [%s] [FATAL] %s\n" "$(date +'%Y.%m.%d %H:%M:%S%z')" "$$" "$@" | tee /dev/fd/3 ; exit 1 ; }


confirm()
{
    (( "$#" != 1 )) && log_fatal "{confirm} missing argument to function"

    # prompt user
    printf "%s? " "$1" >&3

    # capture response
    read -n 1 -r response

    case ${response} in
        y)                                       return 0 ;;
        *) [[ ! -z ${response} ]] && echo >&3 && return 1 ;;
    esac
}


create_symlink()
{
    (( "$#" != 2 )) && log_fatal "{create_symlink} missing argument to function"

    local cmd
    case $(uname -s) in

        Linux)
            cmd="ln --force --no-dereference --symbolic"
        ;;

        Darwin)
            # if ln supports the --version option, it's GNU ln
            if ln --version &> /dev/null; then
                cmd="ln --force --no-dereference --symbolic"
            else
                cmd="ln -fhs"
            fi
        ;;

        *)
            log_fatal "{create_symlink} unknown os [$(uname -s)]"
            return 1
        ;;

    esac

    log_info "{create_symlink} calling [${cmd} $*]"

    local output
    output=$(${cmd} "$@" 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{create_symlink} output [${output}]"
        log_fatal "{create_symlink} exit_status [${exit_status}]"
        return 1
    fi

    log_debug "{create_symlink} output [${output}]"
    log_debug "{create_symlink} exit_status [${exit_status}]"
    return 0
}


create_dir()
{
    (( "$#" != 1 )) && log_fatal "{create_dir} missing argument to function" && return 1

    # if directory already exists, we have nothing to do
    [[ -d $1 ]] && log_debug "{create_dir} dir [$1] already exists" && return 0

    local cmd
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
            return 1
        ;;
    esac

    log_info "{create_dir} calling [${cmd} $1]"

    local output
    output=$(${cmd} "$1" 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{create_dir} output [${output}]"
        log_fatal "{create_dir} exit_status [${exit_status}]"
        return 1
    fi

    log_debug "{create_dir} output [${output}]"
    log_debug "{create_dir} exit_status [${exit_status}]"
    return 0
}


load_bash_profile()
{
    # turn off options while we source the profile
    set +o errexit +o nounset +o pipefail

    source "${HOME}/.bash_profile"

    # restore options
    set -o errexit -o nounset -o pipefail
}


install_vundle()
{
    if [[ -d "${HOME}/etc/vim/bundle/Vundle.vim" ]]; then
        log_info "{install_vundle} ${HOME}/etc/vim/bundle/Vundle.vim already exists"
        return 0
    fi

    # clone the repo
    local cmd="git clone --quiet https://github.com/VundleVim/Vundle.vim.git ${HOME}/etc/vim/bundle/Vundle.vim"
    log_debug "{install_vundle} calling [${cmd}]"

    local output
    output=$(${cmd} 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{install_vundle} output [${output}]"
        log_fatal "{install_vundle} exit_status [${exit_status}]"
        return 1
    fi

    log_debug "{install_vundle} output [${output}]"
    log_debug "{install_vundle} exit_status [${exit_status}]"
    return 0
}


install_vim_plugins()
{
    # run vim command to install other plugins
    local cmd="vim -e +PluginInstall +qall"
    log_debug "{install_vim_plugins} calling [${cmd}]"

    local output
    output=$(${cmd} &> /dev/null)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{install_vim_plugins} output [${output}]"
        log_fatal "{install_vim_plugins} exit_status [${exit_status}]"
        return 1
    fi

    log_debug "{install_vim_plugins} output [${output}]"
    log_debug "{install_vim_plugins} exit_status [${exit_status}]"
    return 0
}


install_tmux_plugin_mgr()
{
    if [[ -d "${HOME}/etc/tmux/plugins/tpm" ]]; then
        log_info "{install_tmux_plugin_mgr} ${HOME}/etc/tmux/plugins/tpm already exists"
        return 0
    fi

    # clone the repo
    local cmd="git clone --quiet https://github.com/tmux-plugins/tpm ${HOME}/etc/tmux/plugins/tpm"
    log_debug "{install_tmux_plugin_mgr} calling [${cmd}]"

    local output
    output=$(${cmd} 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{install_tmux_plugin_mgr} output [${output}]"
        log_fatal "{install_tmux_plugin_mgr} exit_status [${exit_status}]"
        return 1
    fi

    log_debug "{install_tmux_plugin_mgr} output [${output}]"
    log_debug "{install_tmux_plugin_mgr} exit_status [${exit_status}]"
    return 0
}


install_tmux_plugins()
{
    # run specific script to install other plugins
    local cmd="${HOME}/etc/tmux/plugins/tpm/bin/install_plugins"
    log_debug "{install_tmux_plugins} calling [${cmd}]"

    local output
    output=$(${cmd} 2>&1)
    local exit_status=$?

    if [[ "${exit_status}" -ne 0 ]]; then
        log_error "{install_tmux_plugins} output [${output}]"
        log_fatal "{install_tmux_plugins} exit_status [${exit_status}]"
        return 1
    fi

    log_debug "{install_tmux_plugins} output [${output}]"
    log_debug "{install_tmux_plugins} exit_status [${exit_status}]"
    return 0
}


main()
{
    # since this script writes to a log, we need to at least try to create the
    # logs directory
    mkdir -p "${HOME}/var/log"

    log_info "$0"

    [[ -z ${HOME:-} ]] && log_error "error: HOME is not set" && exit 1

    create_dir "${HOME}/bin"
    create_dir "${HOME}/src"
    create_dir "${HOME}/tmp"
    create_dir "${HOME}/var"

    confirm "bash" \
            && create_symlink "${HOME}/etc/bash/bash_profile" "${HOME}/.bash_profile" \
            && create_symlink "${HOME}/etc/bash/bashrc" "${HOME}/.bashrc" \
            && create_dir "${HOME}/var/bash" \
            && create_dir "${HOME}/var/less" \
            && create_dir "${HOME}/var/python" \
            && load_bash_profile \
            && printf " [installed]\n" >&3

    confirm "git" \
            && create_dir "${HOME}/.config" \
            && create_dir "${HOME}/.config/git" \
            && create_symlink "${HOME}/etc/git/config" "${HOME}/.config/git/config" \
            && printf " [installed]\n" >&3

    confirm "htop" \
            && create_dir "${HOME}/.config" \
            && create_dir "${HOME}/.config/htop" \
            && create_symlink "${HOME}/etc/htop/htoprc" "${HOME}/.config/htop/htoprc" \
            && printf " [installed]\n" >&3

    confirm "hushlogin" \
            && touch "${HOME}/.hushlogin" \
            && printf " [installed]\n" >&3

    confirm "i3" \
            && create_dir "${HOME}/.config" \
            && create_dir "${HOME}/.config/i3" \
            && create_dir "${HOME}/.config/i3status" \
            && create_symlink "${HOME}/etc/i3/config" "${HOME}/.config/i3/config" \
            && create_symlink "${HOME}/etc/i3status/config" "${HOME}/.config/i3status/config" \
            && printf " [installed]\n" >&3

    confirm "locate" \
            && create_dir "${HOME}/var/mlocate" \
            && printf " [installed]\n" >&3

    confirm "lftp" \
            && create_dir "${HOME}/.config" \
            && create_dir "${HOME}/.config/lftp" \
            && create_symlink "${HOME}/etc/lftp/rc" "${HOME}/.config/lftp/rc" \
            && printf " [installed]\n" >&3

    confirm "top" \
            && create_symlink "${HOME}/etc/top/toprc" "${HOME}/.toprc" \
            && printf " [installed]\n" >&3

    confirm "tmux" \
            && create_dir "${HOME}/etc/tmux/plugins" \
            && install_tmux_plugin_mgr \
            && install_tmux_plugins \
            && printf " [installed]\n" >&3

    confirm "vim" \
            && create_symlink "${HOME}/etc/vim" "${HOME}/.vim" \
            && create_dir "${HOME}/etc/vim/bundle" \
            && create_dir "${HOME}/var/vim" \
            && install_vundle \
            && install_vim_plugins \
            && printf " [installed]\n" >&3

    confirm "xauthority" \
            && create_dir "${HOME}/var/xauthority" \
            && create_symlink "${HOME}/etc/x/50_xauthority" "${HOME}/etc/bash/bash_profile.$(uname -s).d/50_xauthority" \
            && printf " [installed]\n" >&3

    return 0
} # main()


# main entry point
main "$@"
