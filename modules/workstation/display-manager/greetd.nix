{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "${config.values.mainUser}";
      };

    };

    package = pkgs.greetd.tuigreet;
  };

}
