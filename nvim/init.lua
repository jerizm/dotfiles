local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("lazy").setup({
    spec = {
        { "echasnovski/mini.nvim", version = false },
        { import = "plugins" },
    },
    defaults = {},
    checker = { enabled = true },
    performance = {},
})


-- mini plugins
require('mini.basics').setup()
require('mini.ai').setup()
require('mini.files').setup()
require('mini.fuzzy').setup()
require('mini.notify').setup()
require('mini.cursorword').setup()
require('mini.hipatterns').setup()
require('mini.surround').setup()
require('mini.pairs').setup()
require('mini.jump').setup()
require('mini.splitjoin').setup()
require('mini.indentscope').setup()
require('mini.tabline').setup()
require('mini.statusline').setup()
require('mini.completion').setup()
require('mini.diff').setup()
require('mini.files').setup()
require('mini.pick').setup()
require('mini.bufremove').setup()
require('mini.clue').setup()
require('mini.comment').setup()

--
require("config.options")
require("config.keymaps")
require("catppuccin").setup({
    transparent_background = true,
    flavor = "mocha",
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})

vim.cmd.colorscheme "catppuccin-mocha"
