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
    firewall = {
      checkReversePath = false;
      allowedTCPPorts = [
        5201 # iperf port
        8081
      ];
    };
  };
}
