{
  description = "NixOS config flake";

  inputs = {
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-25.11";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nix-alien.url = "github:thiagokokada/nix-alien";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
    };

    kokoro-tts = {
      url = "github:rafal11ck/kokoro-tts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      lib' = import ./lib { inherit inputs; };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;

      nixosConfigurations = import ./hosts {
        inherit lib';
      };

    };

  nixConfig = {
    extra-substituters = [
      "https://guibou.cachix.org/"
    ];

    extra-trusted-public-keys = [
      "guibou.cachix.org-1:GcGQvWEyTx8t0KfQac05E1mrlPNHqs5fGMExiN9/pbM="
    ];
  };
}
