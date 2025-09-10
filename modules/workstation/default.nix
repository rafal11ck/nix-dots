{
  imports = [
    ./boot.nix
    ./environment.nix
    ./filesystems.nix
    ./fonts.nix
    ./hardware.nix
    ./home-manager.nix
    ./packages.nix
    ./programs.nix
    ./secuirty.nix
    ./services
    ./systemd.nix
    ./users.nix
    ./virtualzation.nix
    ./xdg.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
