"* Vim-Plug 목록
let g:config_dir = expand('~/dotfiles/nvim/config/')
let s:file_plug_candidate = []

command! -nargs=1 PlugFile call <SID>plug_file(<args>)
function! s:plug_file( ... )
    call add(s:file_plug_candidate, g:config_dir . a:1)
endfunction

" 아래와 같이 설정한 다음 :PlugInstall<CR> 해주면 된다.
call plug#begin('~/.vim/plugged')

    "* Vim 기본 기능 확장
        Plug 'simeji/winresizer'
            PlugFile 'set-winresizer.vim'
        PlugFile 'vim-gx-on-regex.vim'

        "* HUD(Head Up Display)
        Plug 'bling/vim-airline'        " BUFFER navigator, status line 을 제공한다.
            PlugFile 'set-airline.vim'
        Plug 'luochen1990/rainbow'      " 괄호를 level 별로 다르게 색칠한다. html 태그에도 적용.
        Plug 'kshenoy/vim-signature'    " m mark 위치를 표시해준다.

        "* text object
        Plug 'kana/vim-textobj-user'
            Plug 'kana/vim-textobj-indent'
            Plug 'thinca/vim-textobj-between'
            PlugFile 'set-vim-textobj-user.vim'
        Plug 'wellle/targets.vim'

        "* 편집 기능 확장
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-commentary'
        Plug 'godlygeek/tabular'           " 텍스트 세로 정렬 도구
        Plug 'jiangmiao/auto-pairs', {'for': ['go', 'javascript', 'rust']}


    "* File 탐색, 브라우징
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

call plug#end()

syntax enable
filetype plugin indent on

for include_file in s:file_plug_candidate
    execute "source " . include_file
endfor
let s:file_plug_candidate = v:null

"* COC plugin 목록
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#install-extensions
" :CocUpdate
let g:coc_global_extensions = [
            \ 'coc-ultisnips',
            \]

"* vim set 설정

    set path+=**
    set nofixeol
    set conceallevel=0
    " set regexpengine=1

    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor\ --column
        set grepformat=%f:%l:%c%m
    elseif executable('ack')
        set grepprg=ack\ --nogroup\ --column\ $*
        set grepformat=%f:%l:%c:%m
    endif

    set nocompatible                  " vi 기능을 사용하지 않고, vim 만의 기능을 사용.
    " set linebreak                     " break at word boundary
    " set showbreak=++
    set list listchars=tab:·\ ,trail:·,extends:>,precedes:<
    set omnifunc=syntaxcomplete#Complete
    set mouse=a

    set hidden  " Buffer should still exist if window is closed
    set nopaste

    set smartcase hlsearch incsearch

    " command line에서 소문자 입력 후 탭을 누르면 대소문자 구분 없이 자동완성
    set ignorecase
    "set tildeop    "~ 를 다른 오퍼레이터와 함께 사용한다.

    " 화면 표시
    set number           " 라인 넘버 출력
    " set relativenumber
    set ruler            " 현재 커서 위치 (row, col) 좌표 출력
    set noerrorbells     " 에러 알림음 끄기
    " set background=dark  " 검정배경을 사용 (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)
    set laststatus=2     " 상태바를 언제나 표시할 것
    set showmatch        " 일치하는 괄호 하이라이팅
    set cursorline       " highlight current line
    set lazyredraw       " redraw only when we need to.
    set showcmd          " airline 플러그인과 충돌 가능성 있음.
    "set nowrap
    " set sidescroll=2 sidescrolloff=10
    set wildmenu wildignorecase
    set wildmode=full

    " 짜증나는 swp, backup 파일 안 만들기
    set noswapfile
    set nobackup

    set noerrorbells visualbell t_vb= " 사운드 벨, 비주얼 벨 비활성화

    augroup setgroup
        autocmd!
        autocmd GUIEnter * set visualbell t_vb=
    augroup END

    "사용
    set bs=indent,eol,start  " backspace 키 사용 가능
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
    "set noimd               " no imdisable 한글 입력기 관련인데 mac 에서는 안 통하는듯
    set cindent autoindent smartindent
    set history=200 undolevels=2000
    " set cursorcolumn
    set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz
    set splitbelow
    set splitright
    set virtualedit=block   " visual block mode를 쓸 때 문자가 없는 곳도 선택 가능하다
    set autoread

    set cursorcolumn
    set cmdheight=2
    set updatetime=300
    setglobal timeoutlen=1200
    setglobal ttimeoutlen=50
    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " This enables us to undo files even if you exit Vim.
    if has('persistent_undo')
        let s:vimDir = '$HOME/.vim'
        let &runtimepath.=','.s:vimDir
        let s:undoDir = expand(s:vimDir . '/undodir')

        call system('mkdir ' . s:vimDir)
        call system('mkdir ' . s:undoDir)

        let &undodir = s:undoDir
        set undofile
    endif

    set statusline+=%*

