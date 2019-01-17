set number
set mouse=nv
set wildmode=longest,list,full
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set completeopt-=preview
" set fdm=indent
set foldlevelstart=1

call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/denite.nvim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'csexton/trailertrash.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-slash'
Plug 'sheerun/vim-polyglot'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'tpope/vim-commentary'
Plug 'pseewald/vim-anyfold'
" Plug 'w0rp/ale'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'natebosch/vim-lsc'
call plug#end()

syntax enable
filetype plugin on
colorscheme seoul256

let g:go_fmt_experimental=1
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 500
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:python_host_prog = $HOME."/.config/nvim/py27/bin/python"
let g:python3_host_prog = $HOME."/.config/nvim/py36/bin/python"

" vim lsc config
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_server_commands = {'python': 'pyls'}
let g:lsc_auto_map = v:true " Use defaults

" Enable completion where available.
" This setting must be set before ALE is loaded.
" let g:ale_completion_enabled = 1
" let g:ale_linters = {
" \   'python': ['pyls'],
" \}


" Start neovim server only once
if empty(glob("/tmp/vim-server"))
    let g:server_addr = serverstart('/tmp/vim-server')
endif

nnoremap <silent> <F2> :<C-u>Denite grep:. -buffer-name=search-buffer<CR>
map <C-F2> <F2><C-R><C-W><CR>
nnoremap <silent> <C-O> :Denite file_rec<CR>
nnoremap <silent> <C-G> :ALENext<CR>

" Saner CTRL-L
" By default, <c-l> clears and redraws the screen (like :redraw!). The following mapping does the same,
" plus de-highlighting the matches found via /, ? etc., plus fixing syntax highlighting (sometimes Vim loses highlighting due
" to complex highlighting rules), plus force updating the syntax highlighting in diff mode:

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>


if executable('fd')
    call denite#custom#var('file_rec', 'command',
        \ ['fd', '--type', 'f', '.'])
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
