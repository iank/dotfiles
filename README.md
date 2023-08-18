# Dotfiles

I use [YADM](https://yadm.io/docs/getting_started) to manage these.

# nvim

I've tried to set this up in such a way that the .vimrc has basic settings
while plugins and anything complicated or heavy goes in neovim's configuration.
This way I can hopefully share the same dotfiles repository on both full-on
development environments and also embedded or temporary environments without
having to maintain variants.

## Plugins

Remember to `:PackerInstall`

```
:MasonInstall rust-analyzer codelldb
```

## Clipboard

Install `xclip` (WSL2, X11) or `wl-clipboard` (Wayland) and `"+y`/`"+p` will work.
