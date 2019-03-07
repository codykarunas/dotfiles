# File: .zshrc

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.zprofile
# source $HOME/.dotfiles/.aliases

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# color term
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export LC_CTYPE=en_US.UTF-8
export LESS=FRX
# export PROMPT="%{$fg[white]%}%m%{$reset_color%} %{$fg[white]%}%c%{$reset_color%} % $ "

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

export FZF_DEFAULT_OPTS='
--color fg:124,bg:16,hl:202,fg+:214,bg+:52,hl+:231
--color info:52,prompt:196,spinner:208,pointer:196,marker:208
'

# make with the pretty colors
autoload colors; colors

# make with the nice completion
autoload -U compinit; compinit

# Completion for kill-like commands
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:ssh:*' tag-order hosts users
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr

# Aliases
alias m="mvim"
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

# REF: https://unix.stackexchange.com/questions/250690/how-to-configure-ctrlw-as-delete-word-in-zsh
my-backward-delete-word() {
  local WORDCHARS=${WORDCHARS/\//}
  zle backward-delete-word
}

zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word
