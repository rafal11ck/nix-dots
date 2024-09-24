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

      svp = self.callPackage (pkgsPath + /svp/package.nix) { };
    })
  ];
}
