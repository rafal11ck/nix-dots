{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hyprland.nix
    ./pipewire.nix
    ./utils.nix
    ./wine.nix
  ];

  services = {
    gnome.sushi.enable = true;
    tumbler.enable = true;
  };

  programs = {
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "foot";
    };
    hyprland = {
      enable = true;
    };
  };

}
