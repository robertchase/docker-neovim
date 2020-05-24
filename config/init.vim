set number
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
set ruler

au BufRead,BufNewFile Makefile* set noexpandtab

" vertical bar at column 80
hi ColorColumn ctermbg=255
autocmd BufRead *.py setlocal colorcolumn=80

" clean up trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" bring in FZF
set rtp+=~/.fzf
" key mapping: fuzzy search and exact search
:map <C-x><C-f> :FZF<Enter>
:map <C-x><C-e> :FZF -e<Enter>

" plug in neomake (for pylint integration)
call plug#begin('~/.config/nvim/plugged')
call plug#end()

" run neomake (pylint) on write
call neomake#configure#automake('w')
let g:neomake_python_enabled_makers = ['pylint']

" key mapping: run neomake (pylint)
:map <C-x><C-l> :Neomake<Enter>
