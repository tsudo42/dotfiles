
set runtimepath+=~/dotfiles/vimex

"basic settings by Doj
set number
set ambiwidth=double
set list
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:%
set tabstop=4
set shiftwidth=4

" Syntax Highlight
let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
	:set term=xterm-256color
	:syntax on
endif

colorscheme iceberg

"settings about lightline by D
set packpath+=~/dotfiles/vimex
set laststatus=2
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'iceberg',
	\ }

" handling problem with slow mode-change by D. What is
" vim-autoclose?
set timeout timeoutlen=1000 ttimeoutlen=50

