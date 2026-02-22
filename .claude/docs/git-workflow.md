# Git Workflow

Bare repo at `~/.dotFiles/`, work tree at `$HOME/`. Use the `config` alias — never plain `git` — for all dotfile operations.

```sh
alias config="git --git-dir=$HOME/.dotFiles/ --work-tree=$HOME/"
```

Common operations:

```sh
config status
config add ~/.config/nvim/init.lua
config commit -m "feat(nvim): add telescope keymap"
config push
```
