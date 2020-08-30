" Use these packages (arch):
" powerline-fonts
" vim-airline
" vim-syntastic
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'lervag/vimtex'

call plug#end()

let g:airline_powerline_fonts = 1
set number
set relativenumber
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++17 -Weverything -Wno-c++98-compat'

let g:tex_flavor = 'latex'

