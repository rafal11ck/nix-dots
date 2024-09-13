{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      modulesPath = ./modules;
      workstation = modulesPath + "/workstation";

      lib' = import ./lib { inherit inputs lib'; };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations = import ./hosts { inherit lib'; };

      # For home-manager standalone install. NixOS-less home manager.
      homeConfigurations."rafal" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          # for user name
          (modulesPath + /shared/values.nix)
          hyprland.homeManagerModules.default
          ./home/home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

    };

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
    ];

    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
}
