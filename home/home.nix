{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    # ./hello.nix
    ./home-cli.nix
    ./home-gui.nix
  ];
}
