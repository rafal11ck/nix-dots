{
  config,
  ...
}:
{
  services = {
    blueman.enable = true;

    gnome.sushi.enable = true;
    tumbler.enable = true;

    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "hyprland";
    };

  };

  systemd.user.services.xdg-desktop-portal-hyprland = {
    after = [ "pipewire.service" ];
    partOf = [ "pipewire.service" ];
  };
}
