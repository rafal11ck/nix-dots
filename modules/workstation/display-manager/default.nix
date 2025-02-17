{
  config,
  lib,
  pkgs,
  ...
}:

{
  #imports = [ ./greetd.nix ];
  #
  services = {
    xserver.displayManager.gdm = {
      enable = true;
    };
  };
}
