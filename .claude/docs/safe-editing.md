# Safe Editing Guidelines

1. Run `config status` before editing to see what is already modified.
2. Edit files at their real paths (`~/.config/nvim/init.lua`, not a copy).
3. Test Neovim changes before committing: open `nvim` and verify no startup errors.
4. NixOS: requires `sudo nixos-rebuild switch` — do not commit untested changes.
5. i3: reload config with `$mod+Shift+r` without logging out.
6. Polybar: relaunch via `~/.config/polybar/launch.sh`.
