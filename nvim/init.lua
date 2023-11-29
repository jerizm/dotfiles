vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("plug")

HOME = os.getenv("HOME")

-- ================ General Config ====================

vim.opt.encoding = "utf-8"
vim.wo.number = true -- Line numbers are good
vim.wo.relativenumber = true -- relative line numbers also good
vim.o.signcolumn = "auto"
vim.opt.backspace = "indent,eol,start" -- Allow backspace in insert mode
vim.opt.history = 1000 -- "Store lots of :cmdline history
vim.opt.showcmd = true -- Show incomplete cmds down the bottom
vim.opt.showmode = true -- Show current mode down the bottom
vim.opt.gcr = "a:blinkon0" -- Disable cursor blink
vim.opt.autoread = true -- Reload files changed outside vim

-- " This makes vim act like all other editors, buffers can
-- " exist in the background without being in a window.
-- " http://items.sjbach.com/319/configuring-vim-right
vim.opt.hidden = true

-- " }}}-------------------------------------------------------------------------
-- "   Undo, Backup and Swap file locations                                  {{{
-- " ----------------------------------------------------------------------------
-- " Save your backups to a less annoying place than the current directory.
-- " If you have .vim-backup in the current directory, it'll use that.
-- " Otherwise it saves it to ~/.nvim/backup or . if all else fails.
-- Backup settings
local backupdir = vim.fn.expand("~/.nvim/backup")
if vim.fn.isdirectory(backupdir) == 0 then
    os.execute("mkdir -p " .. backupdir)
end
vim.opt.backupdir:remove(".")
vim.opt.backupdir:append(".")
vim.opt.backupdir:remove("~")
vim.opt.backupdir:prepend(backupdir)
vim.opt.backupdir:prepend("./.nvim-backup/")
vim.opt.backup = true

-- Swap settings
local swapdir = vim.fn.expand("~/.nvim/swap")
if vim.fn.isdirectory(swapdir) == 0 then
    os.execute("mkdir -p " .. swapdir)
end
vim.opt.directory = "./.nvim-swap//"
vim.opt.directory:append(swapdir .. "//")
vim.opt.directory:append("~/tmp//")
vim.opt.directory:append(".")

-- viminfo settings
vim.opt.viminfo:append("n" .. vim.fn.expand("~/.nvim/viminfo"))

-- Undo settings
if vim.fn.exists("+undofile") == 1 then
    local undodir = vim.fn.expand("~/.nvim/undo")
    if vim.fn.isdirectory(undodir) == 0 then
        os.execute("mkdir -p " .. undodir)
    end
    vim.opt.undodir = "./.nvim-undo//"
    vim.opt.undodir:append(undodir .. "//")
    vim.opt.undofile = true
end

-- " ================ Indentation ======================

-- filetype plugin indent on
-- vim.opt.tabstop=2 shiftwidth=2 expandtab
-- vim.opt.softtabstop=2

-- " Display tabs and trailing spaces visually
vim.opt.list = true
vim.opt.listchars.tab = "\\ \\ "
vim.opt.listchars.trail = "·"

vim.wo.wrap = false
vim.wo.linebreak = true
vim.wo.list = false

-- ================ Folds ============================

vim.opt.foldmethod = "syntax"
vim.opt.foldnestmax = 3
vim.opt.foldenable = false

-- ================ Completion =======================

vim.opt.wildmode = { "list", "longest" }
vim.opt.wildmenu = true
vim.opt.wildignore:append({
    "*.o",
    "*.obj",
    "*~",
    "*vim/backups*",
    "*sass-cache*",
    "*DS_Store*",
    "vendor/rails/**",
    "vendor/cache/**",
    "*.gem",
    "log/**",
    "tmp/**",
    "*.png",
    "*.jpg",
    "*.gif",
})

-- " ================ Scrolling ========================
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- " ================ custom settings ===========================

-- " shared clipboard
--
vim.opt.clipboard = unnamed

-- " airline
--
vim.opt.timeoutlen = 200
vim.opt.ttimeoutlen = 0
vim.opt.laststatus = 2

vim.g["syntastic_javascript_checkers"] = "eslint"

-- " go stuff
-- "
vim.g["syntastic_go_checkers"] = "go", "golint", "govet", "errcheck"
-- " let g:go_list_type = "quickfix"

vim.g["coc_enable_locationlist"] = 0

-- "transparent background (note has to go after local file,
-- "as that might set colors
-- "hi Normal ctermbg=none
vim.cmd("hi LineNr ctermbg=none guibg=bg")
vim.opt.showmode = true

-- " cycle through buffers
vim.api.nvim_set_keymap("n", "<C-b>", ":bnext<CR>", {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap("n", "<C-n>", ":bprevious<CR>", {
    noremap = true,
    silent = true,
})
-- Unite settings
vim.g.unite_data_directory = "~/.nvim/.cache/unite"
vim.g.unite_source_rec_max_cache_files = 100000
vim.g.unite_source_history_yank_enable = 1
vim.g.unite_enable_start_insert = 5
vim.g.unite_split_rule = "botright"
vim.g.unite_force_overwrite_statusline = 0
vim.g.unite_winheight = 25

-- Use 'ag' in unite grep source if 'ag' is executable
if vim.fn.executable("ag") == 1 then
    vim.g.unite_source_grep_command = "ag"
    vim.g.unite_source_grep_default_opts =
        "-i --vimgrep --hidden --ignore .hg --ignore .svn --ignore .git --ignore .bzr"
    vim.g.unite_source_grep_recursive_opt = ""
    vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
end

-- Key mappings
vim.api.nvim_set_keymap("n", "<C-p>", ":FZF<CR>", {
    noremap = true,
})
vim.api.nvim_set_keymap("n", "<F5>", ":GundoToggle<CR>", {
    noremap = true,
})

-- Command
vim.cmd(
    "command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')"
)

-- Hardtime settings
vim.g.hardtime_default_on = 1

-- EasyClip settings
vim.g.EasyClipUseYankDefaults = 0
vim.g.EasyClipUsePasteToggleDefaults = 0

-- Source other vim files
require("syntax")
require("completion")
