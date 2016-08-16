fun! tmuxline#presets#gruvbox#get() abort
  let l:bar = tmuxline#new()

  call l:bar.left.add('a', '#S')
  call l:bar.left.add_left_sep()
  call l:bar.left.add('b', '#W')
  call l:bar.left.add_left_sep()
  call l:bar.left.add('c', '#(whoami)')
  call l:bar.left.add_left_sep()

  call l:bar.right.add_right_sep()
  call l:bar.right.add('y', '%Y-%m-%d')
  call l:bar.right.add_right_alt_sep()
  call l:bar.right.add('y', '%H:%M')
  call l:bar.right.add_right_sep()

  call l:bar.right.add('z', '#h')

  call l:bar.win.add('win.dim', '#I')
  call l:bar.win.add_left_alt_sep()
  call l:bar.win.add('win', '#W')

  call l:bar.cwin.add_right_sep()
  call l:bar.cwin.add('cwin.dim', '#I')
  call l:bar.cwin.add_left_alt_sep()
  call l:bar.cwin.add('cwin', '#W')
  call l:bar.cwin.add_left_sep()

  let l:bar.options['status-justify'] = 'centre'
  let l:bar.win_options['window-status-activity-attr'] = 'none'

  return l:bar
endfun

