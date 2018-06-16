"---------------------------------------------------------------------------
" neovim configurations.
"---------------------------------------------------------------------------

if has('vim_starting') && empty(argv())
  syntax off
endif

let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')

if exists('&inccommand')
  set inccommand=nosplit
endif

" Use cursor shape feature
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Share the histories
autocmd MyAutoCmd CursorHold *
      \if exists(':rshada') | rshada | wshada | endif

autocmd MyAutoCmd FocusGained * checktime

" Modifiable terminal
autocmd MyAutoCmd TermOpen * setlocal modifiable
autocmd MyAutoCmd TermClose * buffer #

let g:terminal_scrollback_buffer_size = 3000

" For denite.nvim in gonvim
let g:gonvim_draw_split = 0
