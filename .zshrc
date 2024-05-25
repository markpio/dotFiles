# Path to oh-my-zsh install
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Load plugins
plugins=(git zsh-autosuggestions)

autoload -Uz vcs_info
autoload -Uz compinit && compinit
autoload -U colors && colors

# Remap caps to escape
setxkbmap -option "caps:escape"

# Make CTRL + space partial accept autosuggestions
bindkey '^ ' forward-word

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats " %{%F{red}%}(%b)%f"

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Set up the prompt (with git branch name)
setopt prompt_subst

prompt='%F{cyan}%n@%m%f:[ %F{blue}%d%f ]${vcs_info_msg_0_} $ '

alias ll='ls -l'
alias mv='mv -v'
alias cp='cp -a -v'
alias tmux='tmux -2'
alias make='make -j$(($(nproc)-1))'

alias dotfiles="git --git-dir=$HOME/.dotFiles/ --work-tree=$HOME/"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
