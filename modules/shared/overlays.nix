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
      mpv = self.mpv-unwrapped.wrapper {
        mpv = self.mpv-unwrapped.override {
          vapoursynthSupport = true;
          sixelSupport = true;
        };
        extraMakeWrapperArgs = [
          # Add paths to required libraries
          "--prefix"
          "LD_LIBRARY_PATH"
          ":"
          "/run/opengl-driver/lib:${lib.makeLibraryPath [ self.ocl-icd ]}"
        ];
      };

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
