{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    settings = {
      build-dir = "/var/tmp";
      auto-optimise-store = true;
      trusted-users = [
        "@wheel"
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      persistent = true;
      dates = "weekly";
    };
  };
}
