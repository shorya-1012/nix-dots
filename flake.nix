{
  description = "Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self , nixpkgs , home-manager, ...}:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      nixos =  lib.nixosSystem {
        inherit system;
        modules = [./nixos/configuration.nix];
      };
    };

    homeConfigurations = {
      shorya =  home-manager.lib.homeManagerConfiguration{
        inherit pkgs;
        modules = [./home-manager/home.nix];
      };
    };
 };
}
