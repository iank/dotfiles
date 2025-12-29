{
  description = "iank dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    mkHome = system: username:
      let
        pkgs = import nixpkgs { inherit system; };
        homeDir = "/home/${username}";
      in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
          extraSpecialArgs = { inherit username homeDir; };
        };
  in {
    homeConfigurations = {
      ian = mkHome "x86_64-linux" "ian";
      ian-arm = mkHome "aarch64-linux" "ian";
    };
  };
}
