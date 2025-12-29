# Dotfiles

I use [YADM](https://yadm.io/docs/getting_started) to manage these.

# neovim

## vim-plug

Install [vim-plug](https://github.com/junegunn/vim-plug):

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Remember to :PlugInstall

## Language servers

https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

### Python

```
npm i -g pyright
```
