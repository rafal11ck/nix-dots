{
  imports = [
    ./boot.nix
    ./environment.nix
    ./filesystems.nix
    ./home-manager.nix
    ./packages.nix
    ./programs.nix
    ./secuirty.nix
    ./services
    ./style
    ./system.nix
    ./systemd.nix
    ./virtualzation.nix
    ./xdg.nix
    ./hardware.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
