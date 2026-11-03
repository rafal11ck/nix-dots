{
  config,
  ...
}:
{
  services = {
    blueman.enable = true;

    gnome.sushi.enable = true;
    tumbler.enable = true;

    displayManager.dux-greeter = {
      enable = true;
      compositor.name = "hyprland";
    };

    displayManager.autoLogin = {
      enable = true;
      user = config.values.mainUser;
    };
    displayManager.defaultSession = "hyprland-uwsm";

  };

  systemd.user.services.xdg-desktop-portal-hyprland = {
    after = [ "pipewire.service" ];
    partOf = [ "pipewire.service" ];
  };
}
