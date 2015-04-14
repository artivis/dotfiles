set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
syntax on

set list
set listchars=tab:>-,trail:☯,extends:>,precedes:<

au BufRead,BufNewFile *.launch set filetype=xml

colorscheme wombat

imap <C-s> <esc>$:x
