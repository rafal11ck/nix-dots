{
  inputs,
  pkgs,
  ...
}:
{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    dms-shell = {
      enable = true;
      package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
