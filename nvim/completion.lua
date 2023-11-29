-- if hidden is not set, TextEdit might fail.
vim.opt.hidden = true

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Better display for messages
vim.opt.cmdheight = 2

-- You will have bad experience for diagnostic messages when it's default 4000.
vim.opt.updatetime = 300

-- don't give |ins-completion-menu| messages.
vim.opt.shortmess:append("c")

-- always show signcolumns
vim.opt.signcolumn = "yes"

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : CheckBackspace() ? "\\<Tab>" : coc#refresh()', {
    expr = true,
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {
    expr = true,
    noremap = true
})

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>\\<C-r>=coc#on_enter()\\<CR>"', {
    expr = true,
    noremap = true,
    silent = true
})

-- Function to check backspace
vim.api.nvim_exec([[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\\s'
endfunction
]], false)

-- Use <c-space> to trigger completion.
if vim.fn.has('nvim') == 1 then
    vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', {
        expr = true,
        noremap = true,
        silent = true
    })
else
    vim.api.nvim_set_keymap('i', '<c-@>', 'coc#refresh()', {
        expr = true,
        noremap = true,
        silent = true
    })
end

-- Remap keys for gotos
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {
    silent = true
})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {
    silent = true
})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {
    silent = true
})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {
    silent = true
})
