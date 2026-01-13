{
  imports = [
    ./hardware.nix
  ];

  networking = {
    hostName = "gram17rg";
  };

  services.fprintd.enable = true;
  nix = {
    settings = {
      max-jobs = 4;
      cores = 6;
    };
  };
}
