{
  imports = [
    ./hardware.nix
  ];

  networking = {
    hostName = "gram17rg";
  };

  services.fprintd.enable = true;
}
