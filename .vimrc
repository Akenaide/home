filetype indent plugin on

":colorscheme dw_green 

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

if has("gui_running")
    set lines=40
endif

if &term =~ '256color'
    set t_ut=
endif

set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

set path=.,,**
set wildmenu
set wildmode=list:longest,list:full

set showmatch
set showcmd
set backspace=indent,eol,start
set hlsearch

set guifont=monospace\ 11                   " Police de caractère monospace

nnoremap H :set cursorline! <CR>
" hi  CursorLine   cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkred guifg=white

nnoremap <silent> <F8> :TagbarToggle<CR>
imap <silent> <F8> <Esc>:TagbarToggle<CR>a
map <S-Tab> gt

nnoremap <silent> <F5> :let @/=''<CR>
imap <silent> <F5> <Esc>:let @/=''<CR>a


nnoremap <silent> <C-O> :FZF -m<CR>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'majutsushi/tagbar'
Plug 'junegunn/seoul256.vim'
call plug#end()
 
syntax enable
" colorscheme flattown
colorscheme seoul256
map <silent> <F5> <Esc>:let @/=''<CR>a
