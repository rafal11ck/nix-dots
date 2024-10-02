{
  config,
  lib,
  pkgs,
  ...
}:

{
  #imports = [ ./greetd.nix ];
  #
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };
}
