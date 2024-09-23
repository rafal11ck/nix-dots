{
  config,
  lib,
  pkgs,
  ...
}:

{
  nixpkgs.overlays = [
    (self: super: {
      mpv = self.svp.mpv;
    })
  ];
}
