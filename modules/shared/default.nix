{
  imports = [
    ./boot.nix
    ./nix.nix
    ./environment.nix
    ./nixpkgs.nix
    ./options.nix
  ];

  i18n = {
    extraLocaleSettings = {
      LC_TIME = "pl_PL.UTF-8";
    };
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  home-manager.backupFileExtension = "backup";
}
