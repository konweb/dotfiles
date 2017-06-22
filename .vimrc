"------------------------------------
" NeoBundle setting
"------------------------------------
set nocompatible
filetype off " for NeoBundle
 
if has('vim_starting')
	set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
	call neobundle#begin(expand('~/.vim/bundle'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()

" NeoBundle で管理するプラグインを追加します。
NeoBundle 'mattn/emmet-vim'

filetype plugin indent on " restore filetype


"------------------------------------
" emmet-vim
"------------------------------------


"------------------------------------
" color
"------------------------------------
syntax on
syntax enable
colorscheme jellybeans


"------------------------------------
" set
"------------------------------------
set number
set tabstop=2
set autoindent
set expandtab
set shiftwidth=4
set backupskip=/tmp/*,/private/tmp/*