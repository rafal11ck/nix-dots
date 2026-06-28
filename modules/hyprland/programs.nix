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
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    dms-shell = {
      enable = true;

      plugins = {
        dankBatteryAlerts.enable = true;
        dankKDEConnect.enable = true;
      };
    };
  };
}
