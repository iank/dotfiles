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

Subsequent updates:

```
home-manager switch --flake .
```

## Private configs

Layer onto this with a private flake. For example:

```nix
# ~/.dotfiles-work/flake.nix
{
  inputs.dotfiles.url = "github:iank/dotfiles";
  outputs = { dotfiles, ... }: {
    homeConfigurations.work = dotfiles.lib.mkHome {
      system = "x86_64-linux";
      username = "work-username";
      modules = [
        dotfiles.homeModules.base
        ./work.nix
      ];
    };
  };
}
```

```nix
# ~/.dotfiles-work/work.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [ whatever ];
}
```
