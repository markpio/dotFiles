export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias l='ls -l'
alias ll='ls -la'
alias cp='cp -a'
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1) /' "

COLOR_RESET="\[\e[0;m\]"
COLOR_GREEN="\[\e[00;32m\]"
COLOR_RED="\[\e[00;31m\]"
COLOR_BLUE="\[\e[00;34m\]"
COLOR_MAGENTA="\[\e[00;35m\]"
COLOR_CYAN="\[\e[00;36m\]"
COLOR_WHITE="\[\e[00;37m\]"
COLOR_BROWN="\[\e[00;33m\]"

PS1="$COLOR_CYAN\u@\h$COLOR_RESET:[ $COLOR_GREEN\w$COLOR_BROWN \$(__git_ps1)$COLOR_RESET] $ "
