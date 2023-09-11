syntax enable
set wildmenu
set wildmode=longest,list,full
set number
set autoindent
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
" set sts=4

" Use fzf installed by homebrew
set rtp+=$HOMEBREW_PREFIX/opt/fzf

" Avoid annoying appear / disappear on error
set signcolumn=yes

let g:mapleader = ' '
let g:python3_host_prog = "/home/kms/.pyenv/versions/3.11.5/envs/neovimpy3/bin/python"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin(data_dir)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'folke/which-key.nvim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/seoul256.vim'

" Plug 'williamboman/nvim-lsp-installer'
" :MasonUpdate updates registry contents
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Plug 'tamago324/nlsp-settings.nvim'
Plug 'psf/black', { 'branch': 'stable' }

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
"
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

Plug 'liuchengxu/vista.vim'
" Plug 'karloskar/poetry-nvim'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Go
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
call plug#end()
colo seoul256

set completeopt=menu,menuone,noselect

" Open :Files
nmap <leader>p <cmd>Files<cr>
" Search tag under cursor
nmap <leader>tu <cmd>Tags <C-r><C-w><cr>
nmap <leader>tt <cmd>Tags <cr>
nmap <leader>tb <cmd>BTags <cr>
" Open Buffer
nmap <leader>b :Buffers <cr>

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" custome preview for FZF
let g:fzf_preview_window = ['up,40%', 'ctrl-/']
lua << EOF
  require('core')
EOF
