set number
set wildmode=longest,list,full
" set mouse=nv
set smartcase
" set completeopt=noinsert,menuone,noselect
" Avoid annoying appear / disappear on error
set signcolumn=yes

set expandtab
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4

let g:python_host_prog = $HOME."/.config/nvim/py27/bin/python"
let g:python3_host_prog = $HOME."/.config/nvim/py36/bin/python"

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'ncm2/ncm2'
Plug 'fatih/vim-go'
Plug 'roxma/nvim-yarp'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-pseudocl' " Deps for vim fnr
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --bin' }
Plug 'junegunn/vim-fnr'
Plug 'tpope/vim-commentary'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

colorscheme seoul256

let g:LanguageClient_serverCommands = {
\ 'python': [$HOME."/.config/nvim/py36/bin/pyls"],
\ 'go': ['gopls'],
\ 'dart': ['dart_language_server'],
\ }


" Start neovim server only once
if empty(glob("/tmp/vim-server"))
    let g:server_addr = serverstart('/tmp/vim-server')
endif

autocmd BufEnter * call ncm2#enable_for_buffer()
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone

" FZF config
nnoremap <silent> <C-O> :Files <CR>
nnoremap <silent> <F2> :Ag 
" search work under cursor
" map <c-F12> <F2><C-R> <C-W><C-R>

" Run gofmt and goimports on save
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
au FileType go nmap <leader>i <Plug>(go-install)

" Saner CTRL-L
" By default, <c-l> clears and redraws the screen (like :redraw!). The following mapping does the same,
" plus de-highlighting the matches found via /, ? etc., plus fixing syntax highlighting (sometimes Vim loses highlighting due
" to complex highlighting rules), plus force updating the syntax highlighting in diff mode:

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
