#!/usr/bin/env bash
# Filename:      ~/dotfiles/bootstrap.sh
# Last modified: 2016.02.22

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

MKDIR="mkdir --mode=0700 --parents"
LN="ln --force --symbolic"
LN_DIR="ln --force --no-dereference --symbolic"

${MKDIR} ${HOME}/.history
${MKDIR} ${HOME}/.logs

confirm "bash?" \
    && ${LN} ${HOME}/dotfiles/bash_profile ${HOME}/.bash_profile \
    && ${LN} ${HOME}/dotfiles/bashrc ${HOME}/.bashrc \
    && ${LN} ${HOME}/dotfiles/profile ${HOME}/.profile \
    && echo " [installed]"

confirm "gdb?" \
    && ${LN} ${HOME}/dotfiles/gdbinit ${HOME}/.gdbinit \
    && echo " [installed]"


confirm "git?" \
    && ${LN} ${HOME}/dotfiles/gitconfig ${HOME}/.gitconfig \
    && echo " [installed]"

confirm "htop?" \
    && ${MKDIR} ${HOME}/.config/htop \
    && ${LN} ${HOME}/dotfiles/htoprc ${HOME}/.config/htop/htoprc \
    && echo " [installed]"

confirm "inputrc?" \
    && ${LN} ${HOME}/dotfiles/inputrc ${HOME}/.inputrc \
    && echo " [installed]"

confirm "hushlogin?" \
    && ${LN} ${HOME}/dotfiles/hushlogin ${HOME}/.hushlogin \
    && echo " [installed]"

confirm "i3?" \
    && ${MKDIR} ${HOME}/.config/i3 \
    && ${MKDIR} ${HOME}/.config/i3status \
    && ${LN} ${HOME}/dotfiles/i3config ${HOME}/.config/i3/config \
    && ${LN} ${HOME}/dotfiles/i3status.conf ${HOME}/.config/i3status/config \
    && echo " [installed]"

confirm "locate?" \
    && ${MKDIR} ${HOME}/local/cache/mlocate \
    && echo " [installed]"

confirm "lftp?" \
    && ${MKDIR} ${HOME}/.config/lftp \
    && ${LN} ${HOME}/dotfiles/lftprc ${HOME}/.config/lftp/rc \
    && echo " [installed]"

confirm "tmux?" \
    && ${MKDIR} ${HOME}/dotfiles/tmux/plugins \
    && ${LN} ${HOME}/dotfiles/tmux.conf ${HOME}/.tmux.conf \
    && ${LN_DIR} ${HOME}/dotfiles/tmux ${HOME}/.tmux \
    && echo " [installed]"

confirm "top?" \
    && ${LN} ${HOME}/dotfiles/toprc ${HOME}/.toprc \
    && echo " [installed]"

confirm "vim?" \
    && ${MKDIR} ${HOME}/dotfiles/vim/bundle \
    && ${LN_DIR} ${HOME}/dotfiles/vim ${HOME}/.vim \
    && ${LN} ${HOME}/dotfiles/vimrc ${HOME}/.vimrc \
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
