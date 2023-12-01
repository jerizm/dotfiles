-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- cycle through buffers
vim.api.nvim_set_keymap("n", "<C-b>", ":bnext<CR>", {
  noremap = true,
  silent = true,
})
vim.api.nvim_set_keymap("n", "<C-n>", ":bprevious<CR>", {
  noremap = true,
  silent = true,
})

-- tmux navigation
local nvim_tmux_nav = require("nvim-tmux-navigation")

nvim_tmux_nav.setup({
  disable_when_zoomed = true, -- defaults to false
})

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
