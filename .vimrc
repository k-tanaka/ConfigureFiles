" カラースキーマの設定
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorschem solarized

"基本設定
set nobk
set bs=2
set autoread

"文字コード設定
set fileformat=unix
set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"インデント設定
set smartindent
set cindent

"Tabキー設定
set ts=4
set sw=4
set sts=0
set expandtab

"検索設定
set incsearch
set smartcase
set wrapscan
set hlsearch

"見た目の設定
set visualbell
set wildmenu
set ruler
set showcmd
set laststatus=2
set number
set title
syntax on

"コーディング時動作
set formatoptions=qro
set showmatch
set foldmethod=marker foldmarker={{{,}}}
set wildmode=list:full
set whichwrap=b,s,h,s,<,>,[,]

"日本語エンコード
if &encoding !=# 'utf-8'
    set encoding=japan
endif
set fileencoding=japan
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがJISX0213に対応しているかをチェック
    if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodingsを構築
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',utf-8'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^euc-\%(jp\|jisx0213\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            let &encoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    unlet s:enc_euc
    unlet s:enc_jis
endif
