"===============文字コードに関する設定================
"ファイル読み込み時の文字コードの設定
set encoding=utf-8

"Vim script内でマルチバイト文字を使う際の設定
scriptencoding uft-8

" 保存時の文字コード
set fileencoding=utf-8

" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932

" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac

" □や○文字が崩れる問題を解決
set ambiwidth=double
"=====================================================

"===============タブやインデントに関する設定===============
"タブ入力を複数の空白文字に置き換える
set expandtab

"画面上でタブ文字が占める幅を規定
set tabstop=2

"連続した空白に対してtab_key やbackspace_keyでカーソルが動く幅を規定
set softtabstop=2

"改行時に前の行のインデントを継続させる
set autoindent

"改行時に前の行の構文をチェックし次の行のインデントを増減させる
set smartindent

"smartindentで増減する幅を規定
set shiftwidth=2

" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
"============================================================


"==================== 検索系============================
"検索結果をハイライト
set hlsearch
"ESC二回押しでハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>

"検索結果に大文字小文字を区別しない
set ignorecase

"検索文字に大文字が含まれていたら、大文字小文字を区別する
set smartcase

"インクリメンタルサーチ"
set incsearch

"----------検索対象から除外するファイルを指定---------
let Grep_Skip_Dirs = '.svn .git'  "無視するディレクトリ
let Grep_Default_Options = '-I'   "バイナルファイルがgrepしない
let Grep_Skip_Files = '*.bak *~'  "バックアップファイルを無視する
"-----------------------------------------------------
"======================================================

"====================syntax系=========================
syntax enable
set background=dark
colorscheme desert

"シンタックスハイライト有効
syntax on
"=======================================================

"======================カーソル系========================
"カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~

"横線を入れる
set cursorline

"行番号を表示する
set number

"INSERTモードのときだけ横線解除
augroup set_cursorline
  autocmd!
  autocmd InsertEnter,InsertLeave * set cursorline!  "redraw!
augroup END

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" タイトルをウインドウ枠に表示する
set title

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

" backspace使用できるように
set backspace=indent,eol,start
"========================================================

"=======================コピー&ペースト系=================
"----------コピーした際に自動インデントでズレない設定----
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" ペーストモードを自動で抜ける設定
autocmd InsertLeave * set nopaste
"--------------------------------------------------------

"====================その他設定===========================
"自動でswpファイル作らない
set noswapfile

"自動補完(タブで移動)
set wildmenu

"保存するコマンド履歴の数を設定
set history=5000

" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee

"Ctags
set tags=./.tags;

" jjでインサートモードを抜ける
inoremap <silent> jj <ESC>
"==========================================================



