# File: .zshrc

source $HOME/.zprofile
# source $HOME/.dotfiles/.aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# Aliases
alias ls="ls -a"
alias ll="ls -al"
alias gst="git status"
alias ..="cd .."
alias pgstart="postgres -D /usr/local/var/postgres"
alias tas="tmux attach-session"
alias be="bundle exec"
alias dev="cd ~/code/webdev"
alias rcs="rails console --sandbox"
alias rc="rails console"
alias dms="rails db:migrate:status"

export FZF_DEFAULT_OPTS='
--color fg:124,bg:16,hl:202,fg+:214,bg+:52,hl+:231
--color info:52,prompt:196,spinner:208,pointer:196,marker:208
'
