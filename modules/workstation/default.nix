{
  imports = [
    ./home-manager.nix
    ./system.nix
    ./services.nix
    ./hyprland.nix
    ./pipewire.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
