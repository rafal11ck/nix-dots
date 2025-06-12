{
  inputs,
  config,
  ...
}:
let
  modulesPath = ./..;
  mkHomeModulePath = modulePath: ../../home-modules + "/${modulePath}";

in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config.home-manager = {
    users.${config.values.mainUser}.imports = [
      (mkHomeModulePath "hyprland")
      (modulesPath + /shared/options.nix)
    ];
  };
}
