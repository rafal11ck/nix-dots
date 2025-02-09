{
  imports = [
    ./boot.nix
    ./nix.nix
    ./nixOSpkgs.nix
    ./overlays.nix
    ./system.nix
    ./values.nix
  ];

  i18n.extraLocaleSettings = {
    LC_TIME = "pl_PL.UTF-8";
  };

  home-manager.backupFileExtension = "backup";
}
