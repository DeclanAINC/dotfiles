{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
      extensions = inputs.nix-vscode-extensions.extensions.${system};
      inherit (pkgs) vscode-with-extensions vscodium;
      packages.default = vscode-with-extensions.override {
        vscode = vscodium;
        vscodeExtensions = [
          extensions.vscode-marketplace.golang.go
          extensions.open-vsx-release.rust-lang.rust-analyzer
        ];
      };
      devShells.default = pkgs.mkShell {
        buildInputs = [ packages.default ];
        shellHook = ''
          printf "VSCodium with extensions:\n"
          codium --list-extensions
        '';
      };
    in 
    {

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs packages devShells;};
          modules = [ 
            ./config.nix
            home-manager.nixosModules.home-manager
            catppuccin.nixosModules.catppuccin
            ./user.nix
          ];
        };

    };
}
