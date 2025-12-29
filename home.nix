{ config, pkgs, username, homeDir, ... }:

{
  home.username = username;
  home.homeDirectory = homeDir;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    tmux
    git
    ripgrep
    fzf
    bc
    coreutils
    neovim
    black
    ruff
    llvmPackages_20.clang-tools
  ];

  home.file.".vimrc".source = ./config/vimrc;
  home.file.".config/fzf/key-bindings.bash".source = ./config/fzf/key-bindings.bash;
  home.file.".config/i3/config".source = ./config/i3/config;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/nvim";

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      sensible
    ];
    extraConfig = ''
      ${builtins.readFile ./config/tmux/tmux.conf}

      set -g @catppuccin_flavor 'mocha'
    '';
  };

  home.shellAliases = {
    ls = "ls --color=auto";
    vi = "nvim";
    vim = "nvim";
  };

  programs.bash = {
    enable = true;
    shellOptions = [
      "histappend"
      "histverify"
      "checkwinsize"
    ];
    historyControl = [ "ignoreboth" ];
    initExtra = ''
      if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
        source ~/.nix-profile/etc/profile.d/nix.sh
      fi

      # Show git branch status in terminal shell.
      . ~/.nix-profile/share/git/contrib/completion/git-prompt.sh
      . ~/.nix-profile/share/git/contrib/completion/git-completion.bash
      export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

      # fzf ^R, etc
      if [ -f ~/.config/fzf/key-bindings.bash ]; then
        source ~/.config/fzf/key-bindings.bash
      fi

      export EDITOR=nvim
    '';
    bashrcExtra = ''
    '';
  };

}
