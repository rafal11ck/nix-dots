{ lib' }:
let
  inherit (lib') mkNixosSystem;

  modulePath = ../modules;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
  gaming = modulePath + /gaming;
  cosmic = modulePath + /cosmic;
in
{
  local-hardware-config = mkNixosSystem {
    system = "x86_64-linux";

    modules = [
      /etc/nixos/hardware-configuration.nix
      shared
      workstation
    ];
  };

  pc01 = mkNixosSystem {
    system = "x86_64-linux";

    modules = [
      ./pc01
      gaming
      shared
      workstation
      cosmic
    ];
  };

  gram17rg = mkNixosSystem {
    system = "x86_64-linux";

    modules = [
      ./gram17rg
      gaming
      shared
      workstation
      cosmic
    ];
  };

}
