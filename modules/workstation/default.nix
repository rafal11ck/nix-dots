{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./boot
    ./desktop
    ./display-manager
    ./driver
    ./services
    ./style
    ./home-manager.nix
    ./system.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
