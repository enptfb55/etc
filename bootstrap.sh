#!/usr/bin/env bash
# Filename:      ~/dotfiles/bootstrap.sh
# Last modified: 2016.02.22

function confirm()
{
    read -n 1 -r -p "${1:-Are you sure? [y/N]} " response
    echo
    case ${response} in
        y)
            true
            ;;
        *)
            false
            ;;
    esac
}

MKDIR="mkdir --mode=0700 --parents"
LN="ln --force --symbolic"
LN_DIR="ln --force --no-dereference --symbolic"

${MKDIR} ${HOME}/.history

confirm "bash?" \
    && ${LN} ${HOME}/dotfiles/bash_profile ${HOME}/.bash_profile \
    && ${LN} ${HOME}/dotfiles/bashrc ${HOME}/.bashrc \
    && ${LN} ${HOME}/dotfiles/profile ${HOME}/.profile

confirm "gdb?" \
    && ${LN} ${HOME}/dotfiles/gdbinit ${HOME}/.gdbinit

confirm "git?" \
    && ${LN} ${HOME}/dotfiles/gitconfig ${HOME}/.gitconfig

confirm "htop?" \
    && ${MKDIR} ${HOME}/.config/htop \
    && ${LN} ${HOME}/dotfiles/htoprc ${HOME}/.config/htop/htoprc

confirm "inputrc?" \
    && ${LN} ${HOME}/dotfiles/inputrc ${HOME}/.inputrc

confirm "hushlogin?" \
    && ${LN} ${HOME}/dotfiles/hushlogin ${HOME}/.hushlogin

confirm "i3?" \
    && ${MKDIR} ${HOME}/.i3 \
    && ${LN} ${HOME}/dotfiles/i3config ${HOME}/.i3/config \
    && ${LN} ${HOME}/dotfiles/i3status.conf ${HOME}/.i3status.conf

confirm "locate?" \
    && ${MKDIR} ${HOME}/local/cache/mlocate

confirm "lftp?" \
    && ${LN} ${HOME}/dotfiles/lftprc ${HOME}/.lftprc

confirm "tmux?" \
    && ${MKDIR} ${HOME}/dotfiles/tmux/plugins \
    && ${LN} ${HOME}/dotfiles/tmux.conf ${HOME}/.tmux.conf \
    && ${LN_DIR} ${HOME}/dotfiles/tmux ${HOME}/.tmux

confirm "top?" \
    && ${LN} ${HOME}/dotfiles/toprc ${HOME}/.toprc

confirm "vim?" \
    && ${MKDIR} ${HOME}/dotfiles/vim/bundle \
    && ${LN_DIR} ${HOME}/dotfiles/vim ${HOME}/.vim \
    && ${LN} ${HOME}/dotfiles/vimrc ${HOME}/.vimrc

confirm "xinit?" \
    && ${LN} ${HOME}/dotfiles/xinitrc ${HOME}/.xinitrc

confirm "xmodmap?" \
    && ${LN} ${HOME}/dotfiles/Xmodmap ${HOME}/.Xmodmap

confirm "xresources?" \
    && ${LN} ${HOME}/dotfiles/Xresources ${HOME}/.Xresources
