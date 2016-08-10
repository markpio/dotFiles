
function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p' | sed 's/\(.*\)/ (\1)/g')
    set_color 0A9
    echo -n (whoami)'@'(hostname)
    set_color FFF
    echo -n ':[ '
    set_color 9F0
    echo -n (prompt_pwd) 
    set_color A60
    echo -n "$git_branch"
    set_color FFF
    echo -n ' ]~> '
    set normal
end

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias mv='mv -v'
alias cp='cp -a -v'

fish_vi_key_bindings
