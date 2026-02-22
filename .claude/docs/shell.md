# Shell Environment

Primary shell: **zsh** with oh-my-zsh. Fallback: bash.

## Key Aliases (`.zshrc`)

| Alias | Expands to |
|---|---|
| `config` | `git --git-dir=$HOME/.dotFiles/ --work-tree=$HOME/` |
| `ll` | `ls -l` |
| `mv` | `mv -v` |
| `cp` | `cp -a -v` |
| `tmux` | `tmux -2` |
| `extract_tar` | `tar -xvzf` |

## Prompt

Format: `user@host:[ /path ] (branch) $`

Implemented via `vcs_info` (zsh built-in). Branch display is git-aware.
