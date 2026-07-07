{
  lib,
  inputs,
  ...
}:
{
  nixpkgs = {
    config = {
      allowUnfree = true;

    };

    overlays = [
      inputs.nix-alien.overlays.default
      (self: super: {

        # TODO: remove after nixpkgs/nixpkgs#538764 lands in stable
        python3Packages = super.python3Packages.override {
          overrides = _: pprev: {
            mpv = pprev.mpv.overridePythonAttrs (old: {
              nativeCheckInputs = (old.nativeCheckInputs or [ ]) ++ [ self.writableTmpDirAsHomeHook ];
            });
          };
        };

        mpv-unwrapped =
          inputs.nixpkgs.legacyPackages.${super.stdenv.hostPlatform.system}.mpv-unwrapped.override
            { vapoursynthSupport = true; };

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

  };
}
