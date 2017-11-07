" denite.nvim config
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'", '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'r', '<denite:do_action:quickfix>', 'noremap')

call denite#custom#alias('source', 'file_rec/git', 'file_rec')

call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('default', 'short_source_names', v:true)

let s:menus = {}
let s:menus.vim = {
  \ 'description': 'Vim',
  \ }
let s:menus.vim.file_candidates = [
  \ ['    > Edit configuation file (init.vim)', '~/.config/nvim/init.vim']
  \ ]
call denite#custom#var('menu', 'menus', s:menus)

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
  \ [ '.git/', 'images/', '*.min.*', 'img/', 'fonts/',
  \ 'log/', 'tmp/', 'coverage/', 'node_modules/'])
