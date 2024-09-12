{ nixpkgs }:
let
  modulePath = ../modules;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
in
{

  local-hardware-config = nixpkgs.lib.nixosSystem {
    specialArgs = {
      #inherit inputs;
    };

    modules = [
      /etc/nixos/hardware-configuration.nix
      shared
      workstation
    ];
  };

}
