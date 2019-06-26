#
# Author: Kowit Karunas
# ZSHRC
#

# export PATH="/usr/local/sbin:$PATH"
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zprofile

# EXPORTS {{{
# export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=vim
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export LC_CTYPE=en_US.UTF-8
export LESS=FRX
# }}}

# ref: https://superuser.com/questions/523564/emacs-keybindings-in-zsh-not-working-ctrl-a-ctrl-e
bindkey -e

autoload -Uz promptinit
promptinit

# export PROMPT='%n@%m:%c > '
export PROMPT='%F{blue}%B%c%b%f $ '
# export PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '

# make with the pretty colors
autoload colors; colors

# make with the nice completion
autoload -U compinit; compinit

# Completion for kill-like commands
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:ssh:*' tag-order hosts users
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr

# ALIASES {{{
alias sites="cd $HOME/Sites"
alias mvim="/usr/local/Cellar/macvim/8.1-155/MacVim.app/Contents/bin/mvim"
alias m="mvim"
alias v="vim"
alias ls="ls -a"
alias ll="ls -al"
alias gp="git push"
alias gst="git status"
alias gc="git commit"
alias ..="cd .."
alias dl="youtube-dl --extract-audio --audio-format mp3"
alias pgstart="postgres -D /usr/local/var/postgres"
alias tas="tmux attach-session"
alias be="bundle exec"
alias dev="cd ~/code/webdev"
alias rcs="rails console --sandbox"
alias rc="rails console"
alias dms="rails db:migrate:status"
alias aws-connect="ssh -i ~/Desktop/master-key-pai.pem ec2-user@54.172.116.241"
# }}}

# POWERLINE SHELL SETTINGS {{{
# function powerline_precmd() {
#     PS1="$(powerline-shell --shell zsh $?)"
# }
# 
# function install_powerline_precmd() {
#   for s in "${precmd_functions[@]}"; do
#     if [ "$s" = "powerline_precmd" ]; then
#       return
#     fi
#   done
#   precmd_functions+=(powerline_precmd)
# }
#
# if [ "$TERM" != "linux" ]; then
#     install_powerline_precmd
# fi

# Ctrl+w DELETE WORD {{{
# REF: https://unix.stackexchange.com/questions/250690/how-to-configure-ctrlw-as-delete-word-in-zsh
my-backward-delete-word() {
  local WORDCHARS=${WORDCHARS/\//}
  zle backward-delete-word
}

zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word
# }}}

# REF: https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_DEFAULT_OPTS='
--color fg:124,bg:16,hl:202,fg+:214,bg+:52,hl+:231
--color info:52,prompt:196,spinner:208,pointer:196,marker:208
--height 10% --reverse
'
