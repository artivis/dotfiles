set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set spell
set hlsearch
set ruler
set undolevels=1000

syntax on

set list
set listchars=tab:>-,trail:☯,extends:>,precedes:<

au BufRead,BufNewFile *.launch set filetype=xml

colorscheme srcery-drk

imap <C-s> <esc>$:x
