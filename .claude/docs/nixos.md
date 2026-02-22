# NixOS

Configs live in `~/.config/nixos/`:

| File | Purpose |
|---|---|
| `configuration.nix` | Main system config |
| `nextcloud.nix` | Nextcloud service module |

These are **not** symlinked — copy to `/etc/nixos/` as needed. Apply changes with:

```sh
sudo nixos-rebuild switch
```

Do not commit without testing the rebuild first.
