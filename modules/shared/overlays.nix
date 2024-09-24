{
  config,
  lib,
  pkgs,
  ...
}:
let
  pkgsPath = ../../pkgs;
in
{
  nixpkgs.overlays = [
    (self: super: {
      mpv = self.svp.mpv;

      # workaroud till PR is merged
      # https://github.com/NixOS/nixpkgs/pull/344152
      svp = self.callPackage (pkgsPath + /svp/package.nix) { };
    })
  ];
}
