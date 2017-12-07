set number
set mouse=nv
set wildmode=longest,list,full
set fdm=indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set completeopt-=preview

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/seoul256.vim'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'dart-lang/dart-vim-plugin'
Plug 'Shougo/denite.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'w0rp/ale'
call plug#end()

syntax enable
filetype plugin on
colorscheme seoul256

let g:go_fmt_experimental=1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:python_host_prog = $HOME."/.config/nvim/py27/bin/python"
let g:python3_host_prog = $HOME."/.config/nvim/py36/bin/python"

" Start neovim server only once
if empty(glob("/tmp/vim-server"))
    let g:server_addr = serverstart('/tmp/vim-server')
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <silent> <F2> :<C-u>Denite grep:. -buffer-name=search-buffer<CR>
map <C-F2> <F2><C-R><C-W><CR>
nnoremap <silent> <C-O> :Denite file_rec<CR>
if executable('pt')
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
au FileType go nmap <leader>i <Plug>(go-install)
