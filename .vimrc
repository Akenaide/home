filetype indent plugin on

syntax enable
set background=dark
" let g:solarized_termcolors=256
colorscheme flattown

set t_Co=256
set nocompatible
set ts=8
set sts=4
set sw=4
set expandtab
set wildmode=longest,list,full
set number
set smartindent
set ai
set backspace=2
set mouse=nv
set fdm=indent
set ruler

set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

set path=.,,**
set wildmenu
set wildmode=list:longest,list:full

set showmatch
set showcmd
set backspace=indent,eol,start
set hlsearch

set rtp+=~/.fzf

set guifont=monospace\ 11                   " Police de caractère monospace

nnoremap H :set cursorline! <CR>
nnoremap <silent> <C-O> :FZF -m<CR>

" set ruler 
" hi  CursorLine   cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkred guifg=white

if &term =~ '256color'
    set t_ut=
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
"Appel des bundles avec pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""
"runtime! autoload/pathogen.vim
"silent! call pathogen#helptags()
"silent! call pathogen#runtime_append_all_bundles()

execute pathogen#infect()

nnoremap <silent> <F8> :TagbarToggle<CR>
imap <silent> <F8> <Esc>:TagbarToggle<CR>a
map <S-Tab> gt

nnoremap <silent> <F5> :let @/=''<CR>
imap <silent> <F5> <Esc>:let @/=''<CR>a
