set number
set tabstop=2
set sts=2
set expandtab
set shiftwidth=2
set hlsearch
set incsearch
set encoding=utf-8
set guifont=Noto\ Mono\ Regular\ 12

let mapleader = " "
let g:pymode_python = 'python3'
syntax on
colorscheme desert
let python_highlight_all=1 " Mark bad whitespaces 

" JS, HTML, CSS indenting
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Python indenting
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set smartindent |
    \ set fileformat=unix

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'airblade/vim-gitgutter' " Support for git change/add/remove on side
Plug 'vim-syntastic/syntastic' " For linting, uses external binaries.
Plug 'tell-k/vim-autopep8' " PEP8 automatically

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" For auto-pep8
autocmd FileType python noremap <buffer> <leader>p :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1
let g:autopep8_indent_size=4

" For syntastic" 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['prospector']
let g:syntastic_python_prospector_args = "--with-tool mypy"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
