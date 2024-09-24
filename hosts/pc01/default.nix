{ config, lib, pkgs, ... }:

{

  imports = [
    ./hardware.nix
  ];

  nixpkgs.config = {
    rocmSupport = true;
  };

  networking.hostName = "pc01";

  services = {
    ollama = {
      enable = true;
      loadModels = [ "codestral" ];
    };
  };
}
