{
  imports = [
    ./filesystems.nix
    ./boot.nix
    ./desktop
    ./display-manager
    ./driver
    ./services
    ./style
    ./home-manager.nix
    ./system.nix
    ./packages.nix
    ./environment.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
