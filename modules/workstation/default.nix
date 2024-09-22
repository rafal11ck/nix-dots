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
    ./dictd.nix
    ./display-manager
    ./home-manager.nix
    ./hyprland.nix
    ./i2c.nix
    ./nvidia.nix
    ./pipewire.nix
    ./plymouth.nix
    ./services.nix
    ./style
    ./system.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
