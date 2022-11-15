syntax enable
set wildmenu
set wildmode=longest,list,full
set number
set autoindent
set ruler
set ts=4
set sw=4
set sts=4

" Avoid annoying appear / disappear on error
set signcolumn=yes

let g:mapleader = ' '
let g:python3_host_prog = $HOME."/.pyenv/versions/3.8.12/envs/py3/bin/python"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin(data_dir)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'folke/which-key.nvim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/seoul256.vim'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'tamago324/nlsp-settings.nvim'
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

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

set completeopt=menu,menuone,noselect

colo seoul256

lua << EOF
require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
require("nvim-lsp-installer").setup {}
require("lsp")
require("trouble").setup {}
EOF

" Open :Files
nmap <leader>p <cmd>Files<cr> 
" Search tag under cursor
nmap <leader>t :Tags <C-r><C-w><cr>
