{
  imports = [
    ./boot.nix
    ./environment.nix
    ./filesystems.nix
    ./fonts.nix
    ./hardware.nix
    ./home-manager.nix
    ./programs.nix
    ./secuirty.nix
    ./services
    ./systemd.nix
    ./users.nix
    ./virtualzation.nix
    ./xdg.nix
  ];

  zramSwap = {
    enable = true;
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
