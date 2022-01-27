export LSCOLORS=cxfxcxdxbxegedabagacad
# export RBENV_ROOT=/usr/local/var/rbenv
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv PATH
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
export PATH="$HOME/.pyenv/shims:$PATH"

# composer PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"
