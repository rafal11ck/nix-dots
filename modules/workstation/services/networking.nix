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
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
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
