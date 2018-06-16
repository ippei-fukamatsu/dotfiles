" denite.nvim config
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'", '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'r', '<denite:do_action:quickfix>', 'noremap')

if executable('rg')
  " Ripgrep command on grep source
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

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

call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
  \ [ '.git/', 'images/', '*.min.*', 'img/', 'fonts/',
  \ 'log/', 'tmp/', 'coverage/', 'node_modules/', '.idea/'])
