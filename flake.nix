{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      modulesPath = ./modules;
      workstation = modulesPath + "/workstation";
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            /etc/nixos/hardware-configuration.nix
            ./modules/shared
            workstation
          ];
        };
      };

      # For home-manager standalone install. NixOS-less home manager.
      homeConfigurations."rafal" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          # for user name
          (modulesPath + /shared/values.nix)
          ./home/home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

    };
}
