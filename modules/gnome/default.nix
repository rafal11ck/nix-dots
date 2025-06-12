{
  pkgs,
  ...
}:
{
  imports = [
    ./services.nix
  ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    pop-shell
  ];
  services.udev.packages = [ pkgs.gnome-settings-daemon ];
}
