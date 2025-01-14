{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    settings = {
      build-dir = "/var/tmp";
    };
  };
}
