local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "folke/which-key.nvim",
    {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
    },
    "folke/neodev.nvim",
    "joshdick/onedark.vim",
    "cocopon/iceberg.vim",
    "vim-airline/vim-airline",
    "vim-airline/vim-airline",
    "itchyny/lightline.vim",
    "sheerun/vim-polyglot",
    {
        "tpope/vim-git",
        ft = "git",
    },
    {
        "plasticboy/vim-markdown",
        ft = "markdown",
    },
    "pangloss/vim-javascript",
    "dense-analysis/ale",
    "svermeulen/vim-easyclip",
    "cocopon/iceberg.vim",
    "airblade/vim-gitgutter",
    "Shougo/unite.vim",
    "Shougo/neomru.vim",
    {
        "Shougo/vimproc.vim",
        build = "make",
    },
    {
        "junegunn/fzf",
        dir = "~/.fzf",
        build = "./install --all",
    },
    "tpope/vim-commentary",
    "editorconfig/editorconfig-vim",
    "christoomey/vim-tmux-navigator",
    "tpope/vim-surround",
    "avakhov/vim-yaml",
    "takac/vim-hardtime",
    "vim-scripts/BufOnly.vim",
    "cespare/vim-toml",
    "jparise/vim-graphql",
    "HerringtonDarkholme/yats.vim",
    {
        "neoclide/coc.nvim",
        branch = "release",
    },
    {
        "neoclide/coc-tsserver",
        build = "yarn install --frozen-lockfile",
    },
    {
        "neoclide/coc-prettier",
        build = "yarn install --frozen-lockfile",
    },
    {
        "neoclide/coc-json",
        build = "yarn install --frozen-lockfile",
    },
    {
        "neoclide/coc-yaml",
        build = "yarn install --frozen-lockfile",
    },
    {
        "neoclide/coc-css",
        build = "yarn install --frozen-lockfile",
    },
    {
        "neoclide/coc-eslint",
        build = "yarn install --frozen-lockfile",
    },
    {
        "felippepuhle/coc-graphql",
        build = "yarn install --frozen-lockfile",
    },
    "jph00/swift-apple",
    "itspriddle/vim-shellcheck",
    "eliba2/vim-node-inspect",
    "xiyaowong/transparent.nvim",
    "github/copilot.vim",
})
