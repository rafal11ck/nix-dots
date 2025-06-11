{
  inputs,
  config,
  ...
}:
let
  modulesPath = ./..;
  homePath = ./../../home;

  homeShared = homePath + /shared;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${config.values.mainUser}.imports = [
      homeShared
      (modulesPath + /shared/options.nix)
      inputs.catppuccin.homeModules.catppuccin
    ];

  };
}
