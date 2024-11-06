{
  lib,
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

      nix-output-monitor =
        let
          icons = {
            "↑" = "f062";
            "↓" = "f063";
            "⏱" = "f520";
            "⏵" = "f04b";
            "✔" = "f00c";
            "⏸" = "f04c";
            "⚠" = "f071";
            "∅" = "f1da";
            "∑" = "f04a0";
          };
        in
        super.nix-output-monitor.overrideAttrs {
          postPatch = ''
            substituteInPlace lib/NOM/Print.hs \
              ${lib.concatLines (lib.mapAttrsToList (old: new: "--replace-fail '${old}' '\\x${new}' \\") icons)}
          '';
        };

    })
  ];
}
