" This loads after the yadr plugins so that plugin mappings can
" be overwritten.

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
