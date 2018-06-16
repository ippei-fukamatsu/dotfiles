" Initialize

filetype off
filetype plugin indent off

set nocompatible
set encoding=utf-8
scriptencoding utf-8

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let g:mapleader="\<Space>"

autocmd FileType,Syntax,BufNewFile,BufNew,BufRead * call s:on_filetype()
autocmd BufWritePre * :%s/\s\+$//ge

if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup MyAutoCmd
    autocmd VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
      \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

" 変更されたら自動で読み込むように
autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC

let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

" -----------------------------------------------------------------------
" Functions

function! s:on_filetype() abort
  if execute('filetype') =~# 'OFF'
    " Lazy loading
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endfunction

autocmd MyAutoCmd BufNewFile * call ConfirmMakeDirectory()
function! ConfirmMakeDirectory()
  let dir = expand("<afile>:p:h")
  if !isdirectory(dir) && confirm("Create a new directory [".dir."]?", "&Yes\n&No") == 1
    call mkdir(dir, "p")
    file %
  endif
endfunction

" -----------------------------------------------------------------------
" Plugins

" Load dein.
let s:dein_dir = expand('$CACHE/dein')
  \. '/repos/github.com/Shougo/dein.vim'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
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

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" -----------------------------------------------------------------------
" Options

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

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

" keymapping timeout
set timeout
set timeoutlen=3000
set ttimeoutlen=100

" backup
set nobackup
set writebackup
set noswapfile

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

" View
set list
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
set laststatus=2
set cmdheight=2
set nostartofline
set scrolloff=5
set showmatch
set matchtime=2
set number
set splitright
set splitbelow
set ttyfast
set colorcolumn=80
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
set novisualbell

" completion
set completeopt=menuone

" window size
set previewheight=8
set helpheight=12

" colorscheme
let g:rehash256 = 1
colorscheme molokai

" Encoding
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

" -----------------------------------------------------------------------
" Keymappings

" normal mode
noremap <Space>h ^
noremap <Space>l $

" window
nnoremap <C-w>v :vnew<CR>
nnoremap <C-w>s :new<CR>
nnoremap <C-w>t :tabnew<CR>

" insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" command mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <END>

nnoremap <silent> <Leader>ss :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>

filetype plugin indent on
syntax on

