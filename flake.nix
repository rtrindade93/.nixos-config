{
  description = "rtrindade93 nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";

    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ...}@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.renna = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = { inherit nixpkgs nixos-hardware; };
        modules = [
          ./hosts/renna
          # Import previous configuration
          ./configuration.nix
        ];
      };
    };
}
