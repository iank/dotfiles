{ config, pkgs, username, homeDir, ... }:

{
  home.username = username;
  home.homeDirectory = homeDir;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tmux
    git
    ripgrep
    fzf
    bc
    coreutils
  ];

  home.file.".vimrc".source = ./config/vimrc;
  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/fzf/key-bindings.bash".source = ./config/fzf/key-bindings.bash;
  home.file.".Xresources".source = ./config/Xresources;
  home.file.".config/i3/config".source = ./config/i3/config;

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

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  home.shellAliases = {
    ls = "ls --color=auto";
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
      # Show git branch status in terminal shell.
      . ~/.nix-profile/share/git/contrib/completion/git-prompt.sh
      . ~/.nix-profile/share/git/contrib/completion/git-completion.bash
      export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

      # fzf ^R, etc
      if [ -f ~/.config/fzf/key-bindings.bash ]; then
        source ~/.config/fzf/key-bindings.bash
      fi
    '';
    bashrcExtra = ''
    '';
  };
}
