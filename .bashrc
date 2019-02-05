[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH=$PATH:/usr/local/bin

export PATH=$HOME/.rbenv/bin:$PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=$HOME/.cargo/bin:$PATH
# export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Don't store duplicates
export HISTCONTROL=erasedups
export CLICOLOR=1
export LSCOLORS=Exgxcxdxbxegedabagacad

# set variable identifying the chroot you work in (used the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#   debian_chroot=$(cat /etc/debian_chroot)
# fi

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

alias .="source"
alias ..="cd .."
alias ll="ls -al"
alias ls="ls -ap"
alias tas="tmux attach-session"
alias da="tmux detach"
alias grep="grep --color"
alias pgstart="postgres -D /usr/local/var/postgres"

# rails aliases
alias be="bundle exec"
