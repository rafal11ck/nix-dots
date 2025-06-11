{
  config,
  ...
}:
{
  services = {
    blueman.enable = true;

    gnome.sushi.enable = true;
    tumbler.enable = true;

    displayManager.gdm = {
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
