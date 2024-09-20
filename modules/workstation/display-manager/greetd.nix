{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${lib.getExe pkgs.hyprland}";
        user = "${config.values.mainUser}";
      };
      default_session = initial_session;
    };

  };

}
