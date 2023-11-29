-- Error and warning signs.
vim.g.ale_sign_error = '⤫'
vim.g.ale_sign_warning = '⚠'
-- Enable integration with airline.
vim.g["airline#extensions#ale#enabled"] = 1

-- ================ FileTypes =======================
vim.cmd([[autocmd BufNewFile,BufRead *.template set filetype=nginx]])
vim.cmd([[autocmd BufNewFile,BufRead .eslintrc set filetype=yaml]])
vim.cmd([[autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile]])

-- for go
vim.cmd([[au FileType go set noexpandtab]])
vim.cmd([[au FileType go set shiftwidth=4]])
vim.cmd([[au FileType go set softtabstop=4]])
vim.cmd([[au FileType go set tabstop=4]])
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_types = 1
vim.g.go_auto_sameids = 1
vim.g.go_fmt_command = "goimports"

-- for Jenkinsfile
vim.cmd([[au BufNewFile,BufRead Jenkinsfile setf groovy]])
