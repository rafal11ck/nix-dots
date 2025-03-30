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
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${config.values.mainUser}.imports = [
      ../../home
      (modulesPath + /shared/values.nix)
      inputs.catppuccin.homeManagerModules.catppuccin
    ];

  };
}
