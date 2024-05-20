
autoload -Uz vcs_info
autoload -Uz compinit && compinit
autoload -U colors && colors

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats "%{$fg[green]%}(%b)%{$reset_color%} "

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Set up the prompt (with git branch name)
setopt prompt_subst

prompt='%{$fg[cyan]%}%n@%m%{$reset_color%}:[ %d ${vcs_info_msg_0_}] $ '

alias python=python3
alias pip=pip3
alias ll='ls -l'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
