{
  lib',
}:
let
  inherit (lib') mkNixosSystem;

  mkModulePath = moduleName: ../modules + "/${moduleName}";
in
{
  local-hardware-config = mkNixosSystem {
    system = "x86_64-linux";

    modules = [
      /etc/nixos/hardware-configuration.nix
      (map mkModulePath [
        "shared"
        "workstation"
      ])
    ];
  };

  pc01 = mkNixosSystem {
    system = "x86_64-linux";

    modules = [
      ./pc01
      (mkModulePath "gaming")
      (mkModulePath "shared")
      (mkModulePath "workstation")
      (mkModulePath "style")
      (mkModulePath "gnome")
    ];

  };

  gram17rg = mkNixosSystem {
    system = "x86_64-linux";

    modules = [
      ./gram17rg
      (mkModulePath "gaming")
      (mkModulePath "shared")
      (mkModulePath "workstation")
      (mkModulePath "hyprland")

    ];

  };

}
