{
  description = "NixOS config flake";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      catppuccin,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      modulesPath = ./modules;

      lib' = import ./lib { inherit inputs lib'; };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations = import ./hosts {
        inherit lib';
      };

    };

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://guibou.cachix.org/"
    ];

    extra-trusted-public-keys = [
      #hyprland
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "guibou.cachix.org-1:GcGQvWEyTx8t0KfQac05E1mrlPNHqs5fGMExiN9/pbM="
    ];
  };
}
