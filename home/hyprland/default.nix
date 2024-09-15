{
  pkgs,
  hyprland,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    # Hyprland is installed by nixos
  };
}
