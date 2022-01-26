# zshの拡張ライブラリのPATH設定
fpath=(/usr/local/share/zsh-completions $fpath)

# 環境変数
export LANG=ja_JP.UTF-8

# 色が使用できるようにする
autoload -Uz colors
colors
export LSCOLORS=cxexcxdxbxegedabagacad
zstyle ':completion:*' list-colors 'di=32' 'ln=34' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# プロンプト
autoload -Uz vcs_info
# PROMPT変数内で変数参照
setopt prompt_subst
#gitブランチの表示
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{blue}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示
precmd () { vcs_info }
function precmd_function(){
  GITUSERNAME=$(git config user.name)
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd_function
PROMPT="%{${fg[red]}%}"
PROMPT=$PROMPT'$GITUSERNAME '
PROMPT=$PROMPT"(git) "
PROMPT=$PROMPT"%{${fg[green]}%}%~ "
PROMPT=$PROMPT'${vcs_info_msg_0_}'
PROMPT=$PROMPT"%{${reset_color}%}
%# "
#3秒以上処理時間がかかったら詳細表示
REPORTTIME=3

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
setopt auto_list

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 選択中の候補を塗りつぶす
zstyle ':completion:*' menu select

# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

#pecoの設定
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# http://d.hatena.ne.jp/eitya/20110707/1310023383
setopt nonomatch

# キーバインディング
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# 補完される前にオリジナルのコマンドまで展開してチェックする
setopt complete_aliases

# ビープ音を鳴らさない
setopt no_beep

# 外部ファイルを読み込む関数の定義
function loadlib(){
  lib=${1:?"You have to specify a library file"}
  if [ -f "$lib" ];then #ファイルの存在を確認
    . "$lib"
  fi
}
loadlib ~/.zshalias
loadlib ~/.zshssh
loadlib ~/.zshgit
