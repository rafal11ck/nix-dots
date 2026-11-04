{
  imports = [
    ./boot.nix
    ./environment.nix
    ./filesystems.nix
    ./fonts.nix
    ./hardware.nix
    ./home-manager.nix
    ./programs.nix
    ./security.nix
    ./services
    ./systemd.nix
    ./users.nix
    ./virtualization.nix
    ./xdg.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
