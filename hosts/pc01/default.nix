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

  programs.steam.enable = true;

  nixpkgs.config = {
   rocmSupport = true;
  };

  networking.hostName = "pc01";

  services = {
    ollama = {
      enable = true;
      loadModels = [ "codestral" ];
      # disable accleration: https://github.com/NixOS/nixpkgs/issues/344182
      acceleration = false;
    };
  };


}
