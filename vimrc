" Filename:      .vimrc
" Last modified: 2013 12 17

set runtimepath+=~/dotfiles/vim
if system("uname") == "Linux\n"
    source ~/dotfiles/vimrc.linux
elseif system("uname") == "Darwin\n"
    source ~/dotfiles/vimrc.osx
endif

