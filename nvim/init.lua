local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

HOME = os.getenv("HOME")

-- ================ General Config ====================

vim.opt.encoding = 'utf-8'
vim.opt.number = true                      --Line numbers are good
vim.opt.relativenumber = true              --relative line numbers also good
vim.opt.backspace="indent,eol,start"  --Allow backspace in insert mode
vim.opt.history=1000                    --"Store lots of :cmdline history
vim.opt.showcmd=true                     --Show incomplete cmds down the bottom
vim.opt.showmode=true                    --Show current mode down the bottom
vim.opt.gcr="a:blinkon0"              --Disable cursor blink
vim.opt.autoread=true                    --Reload files changed outside vim

-- " This makes vim act like all other editors, buffers can
-- " exist in the background without being in a window.
-- " http://items.sjbach.com/319/configuring-vim-right
vim.opt.hidden=true

-- " Change leader to a comma because the backslash is too far away
-- " That means all \x commands turn into ,x
-- " The mapleader has to be set before vundle starts loading all
-- " the plugins.
vim.g.mapleader = " "

-- " }}}-------------------------------------------------------------------------
-- "   Undo, Backup and Swap file locations                                  {{{
-- " ----------------------------------------------------------------------------
-- " Save your backups to a less annoying place than the current directory.
-- " If you have .vim-backup in the current directory, it'll use that.
-- " Otherwise it saves it to ~/.nvim/backup or . if all else fails.
local backup_dir = HOME .. '/.nvim/backup'
if vim.fn.isdirectory(backup_dir) == 0 then
  vim.fn.mkdir(backup_dir, 'p')
end
vim.opt.backupdir = backup_dir
vim.opt.backup = true

-- " Save your swp files to a less annoying place than the current directory.
-- " If you have .vim-swap in the current directory, it'll use that.
-- " Otherwise it saves it to ~/.vim/swap, ~/tmp or .

local swap_dir = HOME .. '/.nvim/swap'
if vim.fn.isdirectory(swap_dir) == 0 then
  vim.fn.mkdir(swap_dir, 'p')
end
vim.opt.directory=swap_dir

-- " viminfo stores the the state of your previous editing session
vim.opt.viminfo = vim.env.HOME .. '/.nvim/viminfo'

if vim.fn.exists("+undofile") ~= 0 then
    -- " undofile - This allows you to use undos after exiting and restarting
    -- " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    -- " :help undo-persistence
    -- " This is only present in 7.3+
    local undo_dir = HOME .. '/.nvim/undo'
    if vim.fn.isdirectory(HOME .. '/.nvim/undo') == 0 then
        vim.fn.mkdir(undo_dir, 'p')
    end
    vim.opt.undodir = undo_dir
    vim.opt.undofile = true
end

-- " ================ Indentation ======================

-- filetype plugin indent on
-- vim.opt.tabstop=2 shiftwidth=2 expandtab
-- vim.opt.softtabstop=2

-- " Display tabs and trailing spaces visually
vim.opt.list = true
vim.opt.listchars = "tab:\\ \\ ,trail:·"

vim.opt.nowrap=true
vim.opt.linebreak=true

-- ================ Folds ============================

vim.opt.foldmethod=syntax
vim.opt.foldnestmax=3
vim.opt.nofoldenable=true

-- ================ Completion =======================

vim.cmd([[
    set wildmode=list:longest
    set wildmenu
    set wildignore=*.o,*.obj,*~
    set wildignore+=*vim/backups*
    set wildignore+=*sass-cache*
    set wildignore+=*DS_Store*
    set wildignore+=vendor/rails/**
    set wildignore+=vendor/cache/**
    set wildignore+=*.gem
    set wildignore+=log/**
    set wildignore+=tmp/**
    set wildignore+=*.png,*.jpg,*.gif
]])
-- "
-- " ================ Scrolling ========================

vim.cmd([[
set scrolloff=8         -- "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
]])
-- " ================ Search ===========================

vim.cmd([[
set incsearch       --" Find the next match as we type the search
set hlsearch        --" Highlight searches by default
set ignorecase      --" Ignore case when searching...
set smartcase       -- " ...unless we type a capital
]])
-- " ================ custom settings ===========================

-- " shared clipboard
--
vim.cmd([[
set clipboard=unnamed
]])

-- " airline
--
vim.cmd([[
set timeoutlen=200 ttimeoutlen=0
set laststatus=2
]])
vim.g['airline#extensions#tabline#enabled'] = 1

-- " make sure powerline glyphs work
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_theme']='iceberg'

vim.g['syntastic_javascript_checkers'] = 'eslint'

-- " go stuff
-- "
vim.g['syntastic_go_checkers'] = 'go', 'golint', 'govet', 'errcheck'
-- " let g:go_list_type = "quickfix"

vim.g['coc_enable_locationlist'] = 0

-- "transparent background (note has to go after local file,
-- "as that might set colors
-- "hi Normal ctermbg=none
vim.cmd([[
hi LineNr ctermbg=none guibg=bg
set showmode

-- " cycle through buffers
nnoremap <C-b> :bnext<CR>
nnoremap <C-n> :bprevious<CR>

-- "
-- " unite
let g:unite_data_directory = '~/.nvim/.cache/unite'
let g:unite_source_rec_max_cache_files = 100000
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 5
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 25

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --vimgrep --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

-- " custom ignore pattern
call unite#custom#source('file_rec,file_rec/async',
            \ 'ignore_pattern', join([
            \ '\.bzr\/',
            \ '\.git\/',
            \ 'vendor\/',
            \ 'node_modules\/',
            \ ], '\|'))

-- " fuzzy matcher and sort everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-p> :FZF<cr>

-- " gundo
nnoremap <F5> :GundoToggle<CR>

-- " colorscheme
syntax on
colorscheme iceberg

-- "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
-- "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
-- "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
-- "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
-- "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
-- " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ }

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

-- " hardtime
let g:hardtime_default_on = 1

map <Leader> <Plug>(easymotion-prefix)

source ~/.config/nvim/syntax.vim
-- " easy clip settings
let g:EasyClipUseYankDefaults = 0
let g:EasyClipUsePasteToggleDefaults = 0

-- " vim plug
if filereadable(expand("~/.config/nvim/completion.vim"))
    source ~/.config/nvim/completion.vim
endif

-- " codeium
let g:codeium_disable_bindings = 1
inoremap <script><silent><nowait><expr> <C-g> codeium#Accept()
inoremap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
inoremap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
inoremap <C-x>   <Cmd>call codeium#Clear()<CR>

let g:transparent_enabled = v:true
]])
