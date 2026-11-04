{
  inputs,
}:
let
  inherit (inputs.nixpkgs) lib;

  getPkgs =
    input: system:
    if (input.legacyPackages.${system} or { }) == { } then
      input.packages.${system}
    else
      input.legacyPackages.${system};

  # Builders
  mkNixosSystem =
    args@{ system, ... }:
    lib.nixosSystem {
      system = null;

      # Infinite recursion if I don't put this here
      specialArgs = {
        inherit inputs;
      };

      modules = [
        {
          _module.args = {
            inherit system;
            flakePkgs = builtins.mapAttrs (_: value: getPkgs value system) inputs;
          };
        }
      ]
      ++ args.modules or [ ];
    };

in
{
  inherit mkNixosSystem;
}
