filetype indent plugin on

":colorscheme dw_green 

set t_Co=256
set nocompatible
set ts=4
set sts=4
set sw=4
set expandtab
set wildmode=longest,list,full
set number
set shiftround
" set smartindent
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



call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --bin' }
Plug 'junegunn/fzf.vim'
" Plug 'majutsushi/tagbar'
" Plug 'tweekmonster/braceless.vim'
Plug 'junegunn/seoul256.vim'
Plug 'Shougo/vimproc.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-fnr'
Plug 'tpope/vim-commentary'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer' }
" Plug 'fatih/vim-go'
" Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'csexton/trailertrash.vim'
Plug 'Shougo/denite.nvim'
Plug 'sheerun/vim-polyglot'
call plug#end()

syntax enable
" colorscheme flattown
colorscheme seoul256

nnoremap <silent> <C-P> :FZF -m<CR>
nnoremap <silent> <F2> :<C-u>Denite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <C-O> :Denite file_rec<CR>
" let g:peekaboo_compact = 1
if executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding = 'utf-8'
    call denite#custom#var('file_rec', 'command',
        \ ['pt', '--nocolor', '--nogroup', '-g', '.'])
    " Change mappings.
    call denite#custom#map(
                \ 'insert',
                \ '<C-j>',
                \ '<denite:move_to_next_line>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'normal',
                \ 's',
                \ '<denite:do_action:split>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'insert',
                \ '<C-k>',
                \ '<denite:move_to_previous_line>',
                \ 'noremap'
                \)

    " Pt command on grep source
    call denite#custom#var('grep', 'command', ['pt'])
    call denite#custom#var('grep', 'default_opts',
                \ ['--nogroup', '--nocolor', '--smart-case'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

let g:ycm_autoclose_preview_window_after_completion = 1
" autocmd FileType python BracelessEnable +indent +highlight
map <C-F2> <F2><C-R><C-W><CR>
au FileType go nmap <leader>i <Plug>(go-install)

