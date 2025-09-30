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
      LANG = "en_US.UTF-8";
    };
    # extraLocales = [ "en_US.UTF-8" ];
    defaultLocale = "pl_PL.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;
    upower.enable = true;
  };

  home-manager.backupFileExtension = "backup";
}
