{ config, pkgs, ... }:

{
  imports = [ ./home.nix ];

  home.packages = with pkgs; [
    nerd-fonts.hack
    steam
    lunatask
    signal-desktop
    discord
    nix-index
  ];

  fonts.fontconfig.enable = true;

  xresources.properties = {
    "XTerm*disallowedWindowOps" = "20,21,SetXprop";
    "XTerm*selectToClipboard" = "true";
    "XTerm*Background" = "black";
    "XTerm*Foreground" = "grey";
    "XTerm*faceName" = "Hack Nerd Font";
    "XTerm*faceSize" = "12";
    "XTerm*metaSendsEscape" = "true";
    "XTerm*vt100.translations" = ''#override \
        Shift Ctrl <Key> C: copy-selection(CLIPBOARD) \n\
        Shift Ctrl <Key> V: insert-selection(CLIPBOARD)
    '';
    "XTerm*termName" = "xterm-256color";
  };
}
