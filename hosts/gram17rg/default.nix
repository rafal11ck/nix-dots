{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware.nix
  ];

  networking = {
    hostName = "gram17rg";
  };

}
