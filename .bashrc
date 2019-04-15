[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source $HOME/.dotfiles/alias

# export PATH=$PATH:/usr/local/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
# export PATH="/usr/local/opt/ncurses/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Don't store duplicates
export HISTCONTROL=erasedups
export CLICOLOR=1
export LSCOLORS=Exgxcxdxbxegedabagacad

case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac


# function _update_ps1() {
#   PS1=$(powerline-shell $?)
# }

# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#   PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

[ -z "$PS1" ] || stty -ixon

prefix=
if [ -n "$SSH_CONNECTION" ]; then
  prefix="\[\033[01;33m\]\u@\h"
else
  prefix="\[\033[01;32m\]\u@\h"
fi

[ -z "$PS1" ] || export PS1="$prefix\[\033[00m\]:\[\033[01;36m\]\W\[\033[00m\] $ "
# [ -z "$PS1" ] || export PS1="$prefix\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\] $ "

if [ -t 1 ]; then
  bind 'set bind-tty-special-chars off'
  bind '"\ep": history-search-backward'
  bind '"\en": history-search-forward'
  bind '"\C-w": backward-kill-word'
  bind '"\C-q": "%-\n"'
fi
