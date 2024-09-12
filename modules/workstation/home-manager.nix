{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  modulesPath = ./..;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config.home-manager = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.rafal.imports = [
      ../../home/home.nix
      (modulesPath + /shared/values.nix)
    ];
  };
}
