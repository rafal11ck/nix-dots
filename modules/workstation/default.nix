{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./automount.nix
    ./boot
    ./desktop
    ./display-manager
    ./driver
    ./services
    ./style
    ./home-manager.nix
    ./system.nix
    ./packages.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
