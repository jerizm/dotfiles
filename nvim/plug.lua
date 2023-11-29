local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({"folke/which-key.nvim", {
    "folke/neoconf.nvim",
    cmd = "Neoconf"
}, "folke/neodev.nvim", "joshdick/onedark.vim", 'cocopon/iceberg.vim', 'vim-airline/vim-airline' -- " Fancy statusline
, 'vim-airline/vim-airline' -- " Syntax
, 'sheerun/vim-polyglot', {
    'tpope/vim-git',
    ft = 'git'
}, {
    'plasticboy/vim-markdown',
    ft = 'markdown'
} -- " Better JS Support
, 'pangloss/vim-javascript' -- " code linting
, 'dense-analysis/ale' -- " delete w/o mucking with clipboard
, 'svermeulen/vim-easyclip' -- " colorschemes
-- " Plug 'joshdick/onedark.vim'
-- " Plug 'morhetz/gruvbox'
, 'cocopon/iceberg.vim' -- " git edits in sidebar
, 'airblade/vim-gitgutter' -- " file switching and viewer
, 'Shougo/unite.vim' -- " support mru and unite
, 'Shougo/neomru.vim', {
    'Shougo/vimproc.vim',
    build = 'make'
}, {
    "junegunn/fzf",
    dir = "~/.fzf",
    build = "./install --all"
}, 'tpope/vim-commentary' -- " respect editor config
, 'editorconfig/editorconfig-vim' -- " tmux pane navigation
, 'christoomey/vim-tmux-navigator' -- " vim surround
, 'tpope/vim-surround', 'avakhov/vim-yaml' -- " hardtime
, 'takac/vim-hardtime' -- " close all buffers but this one
, 'vim-scripts/BufOnly.vim', 'cespare/vim-toml', 'jparise/vim-graphql', 'HerringtonDarkholme/yats.vim' -- " Plug 'mhartington/nvim-typescript', {build =  './install.sh'}
, {
    'neoclide/coc.nvim',
    branch = 'release'
}, {
    'neoclide/coc-tsserver',
    build = 'yarn install --frozen-lockfile'
}, {
    'neoclide/coc-prettier',
    build = 'yarn install --frozen-lockfile'
}, {
    'neoclide/coc-json',
    build = 'yarn install --frozen-lockfile'
}, {
    'neoclide/coc-yaml',
    build = 'yarn install --frozen-lockfile'
}, {
    'neoclide/coc-css',
    build = 'yarn install --frozen-lockfile'
}, {
    'neoclide/coc-eslint',
    build = 'yarn install --frozen-lockfile'
}, {
    'felippepuhle/coc-graphql',
    build = 'yarn install --frozen-lockfile'
}, 'jph00/swift-apple', 'itspriddle/vim-shellcheck', 'eliba2/vim-node-inspect', 'xiyaowong/transparent.nvim'})
-- "" AI
-- "" codeium
-- " Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

-- "" CodeGPT
-- " Plug 'nvim-lua/plenary.nvim'
-- " Plug 'MunifTanjim/nui.nvim'
-- " Plug 'dpayne/CodeGPT.nvim'

-- " transparency
-- " All of your Plugs must be added before the following line
-- filetype plugin indent on    " required
-- call plug#end()
