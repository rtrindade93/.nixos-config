{
  description = "rtrindade93 nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ...}@inputs: {
    nixosConfigurations.t490-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import previous configuration
        ./configuration.nix
      ];
    };
  };
}
