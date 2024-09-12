
{lib'}: let
  inherit (lib') mkNixosSystem;

  modulePath = ../modules;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
in {
  local-hardware-config = mkNixosSystem {
    system = "x86_64-linux";

    modules = [
      /etc/nixos/hardware-configuration.nix
      shared
      workstation
    ];
  };
}
