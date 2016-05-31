" vi基本設定

" 行番号の表示
set number

" vi互換をオフ
set nocompatible

" 新しい行のインデントを現在行と同じにする
set autoindent

" インクリメンタルサーチ設定
set incsearch

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" タブ移動幅
set tabstop=4

" シフト移動幅
set shiftwidth=4

" 行頭の余白内でTabを打ち込むと、'shiftwidth'の数だけインデントする
set smartindent

" un~ファイルを作らない
:set noundofile

" ESCを2回入力で検索時のハイライトを解除
nnoremap <ESC><ESC> :nohlsearch<CR>

" タブをスペースに
set expandtab

set nobackup
set imdisable
set guioptions-=T
set antialias
set showtabline=2
set visualbell t_vb=
set columns=100

" Color Scheme
syntax enable
set background=light
colorscheme darkblue

