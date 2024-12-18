-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.relativenumber = false -- Relative line numbers
opt.clipboard = "" -- dont use system clipboard
vim.g.minipairs_disable = true -- disable minipairs
vim.g.snacks_scroll = false -- disable snacks scroll animation
vim.g.lazyvim_picker = "fzf"
