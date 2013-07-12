" Vim color file
" Maintainer: Rafal Sulejman <rms@poczta.onet.pl>
" Last Change:  2002.06.18
"
" This color scheme uses a black (dark) background.


" Formerly called fnaqevan.vim

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "brians_cs"

highlight Normal    cterm=NONE      ctermbg=DarkGray    ctermfg=white   guibg=gray5     guifg=#FFFFFF   gui=NONE
highlight NonText   cterm=NONE      ctermbg=LightGray   ctermfg=white   guibg=gray15    guifg=white     gui=NONE

" Main colors
"hi Constant     guibg=#000000 guifg=#00B8E0 gui=NONE
highlight Constant      cterm=NONE      ctermbg=Black       ctermfg=LightBlue   guibg=#000000   guifg=#FF3333   gui=NONE
highlight Identifier    cterm=NONE      ctermbg=Black       ctermfg=Red         guibg=#000000   guifg=#FFA850   gui=NONE
"hi Special      guibg=#000000   guifg=#B899C8 gui=NONE
highlight Statement     cterm=NONE      ctermbg=Black       guibg=#000000   guifg=#EEE840 gui=NONE
highlight Preproc       cterm=NONE      ctermbg=Black       guibg=#000000   guifg=#00B098 gui=NONE
"hi Type         guibg=#000000 guifg=#40D040 gui=NONE
highlight Type          cterm=NONE      ctermbg=Black       guibg=#000000   guifg=#33DD00 gui=NONE

" Secondary colors
"hi Comment      guibg=#000000 guifg=#006699 gui=NONE
highlight Comment      cterm=NONE       ctermbg=Black   ctermfg=LightCyan   guibg=#000000   guifg=#3388DD gui=NONE
highlight Visual       cterm=NONE       guibg=#005900   guifg=#40C940 gui=NONE
highlight VisualNOS    cterm=NONE       guibg=#005900   guifg=#40C940 gui=NONE
highlight Search       cterm=NONE       guibg=#707000   guifg=#FFFF00 gui=NONE
highlight IncSearch    cterm=NONE       guibg=#D05000   guifg=#FFE000 gui=NONE

" Special colors
highlight WarningMsg   cterm=NONE       guibg=#707000   guifg=#FFFF00 gui=NONE
highlight MoreMsg      cterm=NONE       guibg=#000070   guifg=#00B8E0 gui=NONE
highlight ErrorMsg     cterm=NONE       guibg=#CC0000   guifg=#FFEE00 gui=NONE
highlight ModeMsg      cterm=NONE       ctermbg=Black   guibg=#000000   guifg=#E8E8E8 gui=NONE
highlight WildMenu     cterm=NONE       guibg=#5f5f5f   guifg=#FFEE60 gui=NONE
highlight StatusLine   cterm=NONE       guibg=#1f1f1f   guifg=#F0F0F0 gui=NONE
highlight StatusLineNC cterm=NONE       guibg=#0f0f0f   guifg=#eaea3a gui=NONE
highlight VertSplit    cterm=NONE       guibg=#1f1f1f   guifg=#F0F0F0 gui=NONE
highlight Error        cterm=NONE       guibg=#EE0000   guifg=#FFDD60 gui=NONE
highlight Todo         cterm=NONE       guibg=#EEE000   guifg=#000000 gui=NONE
highlight Title        cterm=NONE       ctermbg=Black   guibg=#000000   guifg=#ffffff gui=NONE
highlight Question     cterm=NONE       guibg=#005900   guifg=#40E840 gui=NONE
highlight LineNr       cterm=NONE       ctermbg=Black   guibg=#000000   guifg=#F0B0E0 gui=NONE
highlight Directory    cterm=NONE       ctermbg=Black   guibg=#000000   guifg=#D0D0D0 gui=NONE
"hi NonText      guibg=#000000   guifg=#FFDDAA gui=NONE
highlight SpecialKey   cterm=NONE       ctermbg=Black   guibg=#000000   guifg=#FFFFFF gui=NONE

" Diff colors
highlight DiffAdd      cterm=NONE       guibg=#505050   guifg=#D0D0D0 gui=NONE
highlight DiffChange   cterm=NONE       guibg=#505050   guifg=#D0D0D0 gui=NONE
highlight DiffDelete   cterm=NONE       guibg=#505050   guifg=#D0D0D0 gui=NONE
highlight DiffText     cterm=NONE       guibg=#707070   guifg=#F0F0F0 gui=NONE

" Folding colors
highlight Folded       cterm=NONE       guibg=#703070   guifg=#DDB8DD gui=NONE
highlight FoldColumn   cterm=NONE       guibg=#C4153B   guifg=#F0F0F0 gui=NONE

" Cursor colors
highlight Cursor       cterm=NONE       guibg=#FFFFFF   guifg=#000000 gui=NONE
highlight icursor      cterm=NONE       guibg=#FFEE00   guifg=#000000 gui=NONE
highlight ncursor      cterm=NONE       guibg=#FFFFFF   guifg=#000000 gui=NONE
highlight rcursor      cterm=NONE       guibg=#00CCFF   guifg=#000000 gui=NONE
highlight lcursor      cterm=NONE       guibg=#40D040   guifg=#000000 gui=NONE

