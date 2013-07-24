" Filename:      ~/dotfiles/vimrc
" Last modified: 2013.07.24


set colorcolumn=101             " Highlight the 101th column.


" Vundle shit.
"
"
set nocompatible                " This must be first because it changes other options as side effect
filetype off                    " Disable filetype detection.
set rtp+=~/.vim/bundle/vundle   " Add Vundle to the path.
call vundle#rc()                " Some kind of Vundle magic.

" Let Vundle manage Vundle (required).
Bundle 'gmarik/vundle'

" Alternate between h and cpp files.
Bundle 'a.vim'

" Dependency for FuzzyFinder
Bundle 'L9'

" Find files easily.
Bundle 'FuzzyFinder'


filetype plugin indent on       " Required for Vundle



" Editing behavior
"
"
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set wrap                        " Wrap lines at window edge.

set expandtab                   " Insert spaces instead of tabs.
set tabstop=4                   " Tabs are replaced by 4 spaces.
set smarttab                    " Treat 4 spaces as a tab when deleting.
set autoindent                  " Copy indent size from current line to new line.
set copyindent                  " Copy previous line's indent characters.
set shiftwidth=4                " Number of spaces to use for autoindenting.
set shiftround                  " Use multiple of shiftwidth when indenting with '<' and '>'.

" Searching
set hlsearch                    " Highlight search terms.
set ignorecase                  " Ignore case when searching.
set smartcase                   " Ignore case if search pattern is all lowercase, case-sensitive otherwise.
set incsearch                   " Show search matches as you type.

set list                        " Display unprintable characters.
set listchars=tab:»·,trail:·,extends:#,nbsp:·

set relativenumber              " Always show (relative) line numbers.
set scrolloff=4                 " Keep 4 lines off the edges of the screen when scrolling.

set showmatch                   " Show matching parentheses.
set pastetoggle=<F2>            " When in insert mode, press <F2> to go to paste mode, where you can paste mass data that won't be autoindented.
set mouse=a                     " Enable the mouse if the terminal supports it.
set noerrorbells visualbell t_vb=       " Don't beep or flash when error message is printed.
autocmd GUIEnter * set visualbell t_vb= " Don't flash when running gvim.


" Speed up scrolling of the viewport slightly.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Make arrow keys move code.
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

" Editor layout
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " Don't update the display while executing macros.
set laststatus=2                " Tell vim to always put a status line in, even if there is only one window.
set showtabline=2               " Show a tabbar on top, always

" Vim behavior
set history=1000                " Number of commands and search history to remember.
set modeline                    " Allow files to include a 'mode line' to override vim defaults.
set modelines=5                 " Check the first 5 lines for a modeline.
set nobackup                    " Do not keep backup files.
set noerrorbells                " Don't beep. Ever.
set noswapfile                  " Don't produce .swp files.
set ruler                       " Show cursor position all the time.
set showcmd                     " Show partial command in the last line of the screen. This also shows visual selection info.
set title                       " Show the filename in the window title.
set undolevels=1000             " Lots of undo history.
set viminfo='20,\"80            " Read/write a .viminfo file, but don't store more than 80 lines of registers.
set wildmenu                    " Use enhanced command line completion.
set wildignore=*.bak,*.o,*.a    " Ignore these files in file completion.
set wildmode=longest,list       " Make tab copmletion for files/buffers act like bash.
set splitbelow                  " New horizontal-split window appears on bottom.
set splitright                  " New vertical-split window appears on right.

syntax enable
syntax on

" Gvim settings
if has("gui_running")
    colorscheme brians_cs                           " Color scheme.
    set guifont=Fixed\ Medium\ Semi-Condensed\ 10   " Font.
    set guioptions-=T                               " No toolbar.
else
    colorscheme my_inkpot
endif

" Adjust "TODO" colors.
highlight Todo guifg=#40ffff guibg=#606060


" Shortcuts

" No more having to type ':', just type ';' (saves hitting the shift key)
nnoremap ; :

" Change the mapleader from \ to ,
let mapleader=","

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>
inoremap jk <Esc>


" FuzzyFinder tweaks.
"
"
" Make a shortcut to the directory-recursing file search.
nnoremap <Leader>f :FufFile **/<cr>

" limit number of displayed matches
" (makes response instant even on huge source trees)
let g:fuf_enumeratingLimit = 60

" Ignore these directories and file extensions.
let s:slash = '[/\\]'
let s:startname = '(^|'.s:slash.')'
let s:endname = '($|'.s:slash.')'
let s:extension = '\.a|\.bak|\.bin|\.d|\.html|\.jpg|\.o|\.pyc|\.pyx|\.so|\.tsdbo|\.tso|\.ui'
let s:dirname = 'build|deploy|dist|3rdparty|sandbox|\.git|\.hg|.+\.egg-info'
let g:fuf_file_exclude = '\v'.'('.s:startname.'('.s:dirname.')'.s:endname.')|(('.s:extension.')$)'
let g:fuf_dir_exclude = '\v'.s:startname.'('.s:dirname.')'.s:endname

" Filetype specific handling.
" (Only do this part when compiled with support for autocommands.)
if has("autocmd")

    augroup vim_files
        au!
    augroup end

    " Turn off 'spaces instead of tabs' for editing makefiles
    autocmd FileType make setlocal noexpandtab

    " Support Google Protocol Buffer syntax highlighting
    augroup filetype
        au! BufRead,BufNewFile *.proto setfiletype proto
    augroup end

    " Wrap text to 80 chars in *.txt files.
    autocmd BufRead,BufNewFile *.txt set textwidth=80

endif " has("autocmd")


" NERD settings
"
"

let NERDSpaceDelims=1           " Insert a space after each comment character.
let NERDDefaultAlign='start'    " Align comments at index 0 on toggle.



" This is here so that tmux will send xterm-style keys when its xterm-keys option is on.
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif


" Alt-j/k inserts blank line below/above current line.
nnoremap <silent><A-j> :put =''<CR>
nnoremap <silent><A-k> :put! =''<CR>


" Change cursor in terminal vim (and under tmux).
if &term =~ '^xterm' || &term =~ '^screen'

    " 1 or 0 -> blinking block
    " 2 -> solid block
    " 3 -> blinking underscore
    " 4 -> solid underscore

    " Solid underscore in insert mode
    let &t_SI .= "\<Esc>[4 q"

    " Blinking block in command mode
    let &t_EI .= "\<Esc>[1 q"

endif

"eof
