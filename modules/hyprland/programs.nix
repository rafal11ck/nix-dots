{
  inputs,
  pkgs,
  ...
}:
{

  imports = [ inputs.dms-plugin-registry.nixosModules.default ];

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    dux-shell = {
      enable = true;

      plugins = {
        dankKDEConnect.enable = true;
      };
    };
  };
}
