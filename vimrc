" Initialize {{{1

if &compatible
  set nocompatible
endif

set encoding=utf-8
scriptencoding utf-8
let g:mapleader='['

augroup MyAutoCmd
  autocmd!
  autocmd FileType,Syntax,BufNewFile,BufNew,BufRead *
    \ call s:on_filetype()
  autocmd CursorHold *.toml syntax sync minlines=300
augroup END

if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup MyAutoCmd
    autocmd VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
      \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

let $DOTVIM=expand('~/.vim')
let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

" -----------------------------------------------------------------------
" Functions {{{1

function! s:on_filetype() abort "{{{
  if execute('filetype') =~# 'OFF'
    " Lazy loading
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endfunction "}}}
" }}}


" -----------------------------------------------------------------------
" Plugins {{{1

" Load dein.
let s:dein_dir = expand('$CACHE/dein')
  \. '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_dir
  if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein configurations.
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml('~/.vim/dein/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.vim/dein/deinlazy.toml', {'lazy' : 1})
  if has('nvim')
    call dein#load_toml('~/.vim/dein/deineo.toml', {})
  endif

  if dein#tap('deoplete.nvim') && has('nvim')
    call dein#disable('neocomplete.vim')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  " Installation check.
  call dein#install()
endif
" }}}


" -----------------------------------------------------------------------
" Options {{{1

" Search {{{2
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
nnoremap <ESC><ESC> :nohlsearch<CR>

" tab
set smarttab
set expandtab
set shiftwidth=4

" indent
set autoindent
set smartindent
set shiftround

" disable modeline
set modelines=0
set nomodeline

" clipboard
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
  else
    set clipboard& clipboard+=unnamed
  endif
endif

" keymapping timeout
set timeout
set timeoutlen=3000
set ttimeoutlen=100

" backup
set nobackup
set writebackup
set noswapfile

" make directory if parent directory doesn't exist
autocmd MyAutoCmd BufNewFile * call PromptAndMakeDirectory()
function! PromptAndMakeDirectory()
  let dir = expand("<afile>:p:h")
  if !isdirectory(dir) && confirm("Create a new directory [".dir."]?", "&Yes\n&No") == 1
    call mkdir(dir, "p")
    " Reset fullpath of the buffer in order to avoid problems when using autochdir.
    file %
  endif
endfunction

" autofmt
set formatexpr=autofmt#japanese#formatexpr()

" Default home directory.
let t:cwd = getcwd()

" etc
set backspace=indent,eol,start
set hidden
set matchpairs+=<:>
set grepprg=grep\ -inH
set updatetime=1000
set virtualedit=block
set autoread
set formatoptions=lmoq
set mouse-=a
set modifiable
set write
" }}}

" View {{{2
set list
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
set laststatus=2
set cmdheight=2
set noshowcmd
set nostartofline
set scrolloff=5
set showmatch
set matchtime=2
set number
set splitright
set splitbelow
set t_ut=
set ttyfast
set colorcolumn=79
let g:did_install_default_menus = 1

" break
set linebreak
set showbreak=\
set whichwrap+=h,l,<,>,[,],b,s,~
if exists('+breakindent')
  set breakindent
  set wrap
else
  set nowrap
endif

" disable bell
set t_vb=
set novisualbell

" completion
set completeopt=menuone

" window size
set previewheight=8
set helpheight=12

" colorscheme
let g:rehash256 = 1
colorscheme molokai
" }}}

" Encoding {{{2
set fileencoding=utf-8
let &fileencodings = join([
  \ 'ucs-bom', 'utf-8', 'iso-2022-jp-3', 'euc-jp', 'sjis', 'cp932'])
set fileformats=unix,dos,mac

if exists('&ambiwidth')
  set ambiwidth=double
endif

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

"}}}


" -----------------------------------------------------------------------
" Keymappings {{{1

" normal mode {{{2
noremap <Space>h ^
noremap <Space>l $
nnoremap <C-w>v :vnew<CR>
nnoremap <C-w>s :new<CR>
nnoremap <C-w>t :tabnew<CR>
nnoremap <silent> <C-n> gt
nnoremap <silent> <C-p> gT
nnoremap <silent> <C-l> :<C-u>redraw!<CR>
nnoremap <silent> <Space>o :<C-u>for i in range(1, v:count1) \| call append(line('.'),   '') \| endfor \| silent! call repeat#set("<Space>o", v:count1)<CR>j
nnoremap <silent> <Space>O :<C-u>for i in range(1, v:count1) \| call append(line('.')-1,   '') \| endfor \| silent! call repeat#set("<Space>o", v:count1)<CR>k
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" insert mode {{{2
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"}}}

"}}}

