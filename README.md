# Dotfiles

Install the Nix package manager:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Activate:

```
git clone git@github.com:iank/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
nix run github:nix-community/home-manager -- switch --flake .
```

(May need to also pass -b backup on the first run)

## Font

[HackNerdFont-Regular](https://www.nerdfonts.com/font-downloads)

On Ubuntu, place in ~/.fonts and run `fc-cache -fv`

On Windows, right click and install a .ttf

In Windows Terminal preferences, open the JSON file and insert into profile:

```
                "font":
                {
                  "face": "CaskaydiaCove Nerd Font Mono",
                  "features": {
                    "liga": 0,
                    "calt": 0
                  }
                },
```

# Misc

```
dconf write "/org/gnome/desktop/input-sources/xkb-options" "[ 'caps:swapescape']" `
```

# Clipboard

I use OSC52 in vim/tmux. gnome-terminal doesn't support it, so I use xterm or Windows Terminal

May need to xrdb -merge ~/.Xresources
