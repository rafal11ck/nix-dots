{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    killall
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      # false as it conflucts with uwsm
      enable = false;
    };
  };

  imports = [
    ./tofi.nix
    ./services.nix
  ];
}
