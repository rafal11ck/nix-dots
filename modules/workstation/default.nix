{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./amd.nix
    ./boot
    ./display-manager
    ./home-manager.nix
    ./hyprland.nix
    ./pipewire.nix
    ./plymouth.nix
    ./services.nix
    ./style
    ./system.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
