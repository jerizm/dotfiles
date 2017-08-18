" ================ FileTypes =======================
autocmd BufNewFile,BufRead *.template set filetype=nginx
autocmd BufNewFile,BufRead .eslintrc set filetype=yaml
autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile

" for go
autocmd BufRead,BufNewFile *.go set invlist
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

" for Jenkinsfile

au BufNewFile,BufRead Jenkinsfile setf groovy
