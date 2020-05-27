export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export LSCOLORS=cxfxcxdxbxegedabagacad
# export RBENV_ROOT=/usr/local/var/rbenv
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
#export PATH="/Applications/XAMPP/xamppfiles/bin:$PATH"
export PATH="$PATH:/Applications/XAMPP/xamppfiles/bin"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# composer PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"

# php7.2 PATH
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/php@7.2/lib"
export CPPFLAGS="-I/usr/local/opt/php@7.2/include"

