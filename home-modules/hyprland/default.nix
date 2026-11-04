{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    #for screenshots
    swappy
    grim
    slurp

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
