[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH=$PATH:/usr/local/bin
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


function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

if [ -t 1 ]; then
  bind 'set bind-tty-special-chars off'
  bind '"\ep": history-search-backward'
  bind '"\en": history-search-forward'
  bind '"\C-w": backward-kill-word'
  bind '"\C-q": "%-\n"'
fi

alias vim="/usr/local/bin/nvim"
alias .="source"
alias ..="cd .."
alias ll="ls -al"
alias ls="ls -ap"
alias tas="tmux attach-session"
alias da="tmux detach"
alias grep="grep --color"
alias pgstart="postgres -D /usr/local/var/postgres"
alias gst="git status"

# rails aliases
alias be="bundle exec"
