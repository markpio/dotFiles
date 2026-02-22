# Repo Layout

Work tree root is `$HOME/`. Key tracked paths:

```
~/
├── .zshrc                            # primary shell (zsh + oh-my-zsh)
├── .bashrc                           # bash fallback
├── .gitconfig                        # editor=nvim, defaultBranch=main
├── .tmux.conf                        # tmux config
├── .wezterm.lua                      # WezTerm terminal
├── .vimrc / .vim/                    # Vim fallback + pathogen, colorschemes
├── .Xresources                       # X display settings
├── .gdbinit                          # GDB startup commands
├── clang-format                      # clang-format style (C++)
│
├── .config/
│   ├── alacritty/alacritty.toml
│   ├── i3/config                     # i3 window manager
│   ├── polybar/                      # status bar (config + launch.sh)
│   ├── kak/                          # Kakoune (kakrc, i3/tmux variants)
│   ├── nvim/                         # Neovim — see neovim.md
│   ├── nixos/                        # NixOS configs — see nixos.md
│   ├── zellij/config.kdl
│   └── old-dotfiles/                 # archived Regolith/Sway configs
│
├── scripts/
│   └── fedora-package-script.py
│
├── wallpaper/
│
└── .claude/
    ├── agents/                       # sub-agents — see agents table in CLAUDE.md
    ├── command-templates/            # reusable slash command templates for new projects
    └── docs/                         # this documentation
```
