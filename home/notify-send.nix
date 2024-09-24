{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    libnotify #provides notify-send
  ];
}
