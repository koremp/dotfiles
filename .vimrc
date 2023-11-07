call plug#begin()
  Plug 'preeservim/nerdtree'
  Plug 'mhinz/vim-startify'
  Plug 'vimwiki/vimwiki'
  Plug 'wakatime/vim-wakatime'
  Plug 'tpope/vim-surround'
  Plug 'kana/vim-textobj-user'
call plug#end()

set history=1000
set undolevels=10000

set nofixeol
set conceallevel=0
set nocompatible
set mouse=a
set hidden
set nopaste
set smartcase hlsearch incsearch
set ignorecase
set number
set ruler
set noerrorbells
seet laststatus=2
set showmatch
set cursorline
set lazyredraw
set showcmd
set wildmenu wildignorecase
set wildmode=full
set noswapfile
set nobackup

set bs=indent,eol,start
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
set cindent autoindent smartindent

set virtualedit=block
set autoread
set cursorcolumn
set cmdheight=2
set updatetime=300
set fileencodings=utf-8,euc-kr
