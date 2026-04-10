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
}
