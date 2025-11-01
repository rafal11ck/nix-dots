{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    settings = {
      build-dir = "/nix/var/nix/builds";
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
