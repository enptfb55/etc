" Filename:      ~/dotfiles/vimrc
" Last modified: 2013 07 08

set nocompatible    " This must be first, because it changes other options as side effect


set colorcolumn=101             " Highlight the 101th column.

" Turn on cursor line when in command mode, off when in insert mode.
" au InsertEnter * :set nocursorline
" au InsertLeave * :set cursorline
" au FocusLost *   :set cursorline
" au FocusGained * :set nocursorline


"
" Editing behavior
"
filetype on                     " Enable filetype detection.
filetype plugin on              " Load plugin scripts (if available) for specific filetypes.
filetype indent on              " Load indent scripts (if available) for specific filetypes.

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
"    set lines=50 columns=96 linespace=0             " Window size.
else
    colorscheme my_inkpot
endif

" Colors
" Set the search highlight color
" highlight Search ctermbg=darkcyan

" Adjust the color for comments to be a lighter blue. Easier to read on a black terminal
" highlight Comment ctermfg=darkcyan

" Adjust "TODO" colors.
highlight Todo guifg=#40ffff guibg=#606060


" Shortcuts

" No more having to type ':', just type ';' (saves hitting the shift key)
nnoremap ; :
"
" Change the mapleader from \ to ,
let mapleader=","
"
"" Use the damn hjkl keys
"" map <up> <nop>
"" map <down> <nop>
"" map <left> <nop>
"" map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" Edit the vimrc file
"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>
inoremap jk <Esc>

"" Quick alignment of text
"nmap <leader>al :left<CR>
"nmap <leader>ar :right<CR>
"nmap <leader>ac :center<CR>


" TagList settings

"" Map the F8 key to toggle TagList
"nnoremap <silent> <F8> :TlistToggle<CR>
"
"nmap <leader>l :TlistClose<CR>:TlistToggle<CR>
"nmap <leader>L :TlistClose<CR>
"
"" quit Vim when the TagList window is the last open window
"let Tlist_Exit_OnlyWindow=1         " quit when TagList is the last open window
"let Tlist_GainFocus_On_ToggleOpen=1 " put focus on the TagList window when it opens
""let Tlist_Process_File_Always=1     " process files in the background, even when the TagList window isn't open
""let Tlist_Show_One_File=1           " only show tags from the current buffer, not all open buffers
"let Tlist_WinWidth=40               " set the width
"let Tlist_Inc_Winwidth=1            " increase window by 1 when growing
"
"" shorten the time it takes to highlight the current tag (default is 4 secs)
"" note that this setting influences Vim's behaviour when saving swap files,
"" but we have already turned off swap files (earlier)
""set updatetime=1000
"
"" the default ctags in /usr/bin on the Mac is GNU ctags, so change it to the
"" exuberant ctags version in /usr/local/bin
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"
"" show function/method prototypes in the list
"let Tlist_Display_Prototype=1
"
"" don't show scope info
"let Tlist_Display_Tag_Scope=0
"
"" show TagList window on the right
"let Tlist_Use_Right_Window=1


" Filetype specific handling.
" (Only do this part when compiled with support for autocommands.)
if has("autocmd")

    augroup vim_files
        au!
"        autocmd filetype vim set expandtab    " disallow tabs in Vim files
    augroup end

    " Turn off 'spaces instead of tabs' for editing makefiles
    autocmd FileType make setlocal noexpandtab

    " highlight any line longer than 80 chars
"    autocmd filetype cpp,python,rst match DiffAdd '\%>79v.\+'

    " Highlight in a different color any column > 80
"    highlight RightMargin   ctermbg=237 guibg=#444444
"    autocmd BufWinEnter *\.[hc]pp\|\.impl\|\.[hc]\|\.py\|\.pl let w:ml=matchadd( 'RightMargin', '\%>100v.\+', -1 )

    " Support Google Protocol Buffer syntax highlighting
    augroup filetype
        au! BufRead,BufNewFile *.proto setfiletype proto
    augroup end

    " Wrap text to 80 chars in *.txt files.
    autocmd BufRead,BufNewFile *.txt set textwidth=80

endif " has("autocmd")


"
" NERD settings
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


" Insert single char (repeatable)
function! RepeatChar(char, count)
    return repeat(a:char, a:count)
endfunction
nnoremap <silent> s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>


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
