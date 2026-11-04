{
  pkgs,
  ...
}:
{
  imports = [
    ./tofi.nix
    ./services.nix
  ];

  home.packages = with pkgs; [
    killall
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd = {
      # false as it conflucts with uwsm
      enable = false;
    };
  };
}
