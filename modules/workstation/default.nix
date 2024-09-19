{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./home-manager.nix
    ./hyprland.nix
    ./catppuccin.nix
    ./pipewire.nix
    ./services.nix
    #./style.nix
    ./system.nix
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
