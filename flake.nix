{
  description = "iank dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      mkHome =
        {
          system,
          username,
          homeDir ? "/home/${username}",
          modules,
        }:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit modules;
          extraSpecialArgs = { inherit username homeDir; };
        };
      mkImpureHome =
        modules:
        mkHome {
          system = builtins.currentSystem;
          username = builtins.getEnv "USER";
          homeDir = builtins.getEnv "HOME";
          inherit modules;
        };
    in
    {
      # expose mkHome, homeModules so private flakes can layer configs on top of this one
      lib = { inherit mkHome; };
      homeModules = {
        base = ./home.nix;
        desktop = ./desktop.nix;
      };

      homeConfigurations = {
        default = mkHome {
          system = "x86_64-linux";
          username = "ian";
          modules = [ ./home.nix ];
        };
        desktop = mkHome {
          system = "x86_64-linux";
          username = "ian";
          modules = [ ./desktop.nix ];
        };

        auto = mkImpureHome [ ./home.nix ];
      };
    };
}
