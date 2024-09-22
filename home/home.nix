{
  config,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.overlays = self: super: {
    mpv = super.mpv.override { vapoursynthSupport = true; };
  };

  imports = [
    # ./hello.nix
    ./home-cli.nix
    ./home-gui.nix
  ];
}
