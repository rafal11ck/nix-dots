{
  config,
  lib,
  pkgs,
  ...
}:

{

  networking = {
    networkmanager = {
      enable = true;
    };
    firewall.checkReversePath = false; 
  };
}
