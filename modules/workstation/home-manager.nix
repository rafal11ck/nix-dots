{
  inputs,
  config,
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
    users.${config.values.mainUser}.imports = [
      ../../home/home.nix
      (modulesPath + /shared/values.nix)
    ];

  };
}
