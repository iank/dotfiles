# Dotfiles

I use [YADM](https://yadm.io/docs/getting_started) to manage these.

# virtualenvwrapper

```
$ pip install virtualenvwrapper
```

# nvim

I've tried to set this up in such a way that the .vimrc has basic settings
while plugins and anything complicated or heavy goes in neovim's configuration.
This way I can hopefully share the same dotfiles repository on both full-on
development environments and also embedded or temporary environments without
having to maintain variants.

## Plugins

Remember to `:PackerInstall`, maybe `:PackerCompile` as well

# tmux

## TPM

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

prefix + I

## Font

[HackNerdFont-Regular](https://github.com/ryanoasis/nerd-fonts/releases)

On Windows, right click and install a .ttf

On Ubuntu, place in ~/.fonts and run `fc-cache -fv`

# Misc

```
dconf write "/org/gnome/desktop/input-sources/xkb-options" "[ 'caps:swapescape']" `
```

# Clipboard

I use OSC52 in vim/tmux. gnome-terminal doesn't support it, so I use xterm or Windows Terminal

May need to xrdb -merge ~/.Xresources
