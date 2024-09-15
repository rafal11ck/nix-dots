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
    useGlobalPkgs = true;
    useUserPackages = true;
    users.rafal.imports = [
      ../../home/home.nix
      (modulesPath + /shared/values.nix)
    ];

  };
}
