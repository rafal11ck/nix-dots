{
  config,
  lib,
  pkgs,
  ...
}:

{
  services = {
    xserver.displayManager.gdm = {
      enable = true;
    };

    displayManager = {
      autoLogin = {
        enable = true;
        user = config.values.mainUser;
      };
    };
  };
}
