{
  inputs,
  config,
  ...
}:
let
  modulesPath = ./..;
  mkHomeModulePath = moduleName: ../../home-modules + "/${moduleName}";
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config.home-manager = {
    users.${config.values.mainUser}.imports = [
      (mkHomeModulePath "style")
      (modulesPath + /shared/options.nix)
      inputs.catppuccin.homeModules.catppuccin
    ];

  };
}
