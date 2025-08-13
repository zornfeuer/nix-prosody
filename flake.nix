{
  description = "Prosody XMPP Server configuration";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations."tulip-utahlite13742" = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs = import nixpkgs {
          inherit system;
        };
        inherit inputs system;
      };
      modules = [ 
        ./nixos/configuration.nix
      ];
    };

    homeConfigurations."prosody-op" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}
