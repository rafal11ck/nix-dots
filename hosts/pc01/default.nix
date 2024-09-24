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

  networking.hostName = "pc01";


  programs.steam.enable = true;

  nixpkgs.config = {
   rocmSupport = true;
  };


  services = {
    ollama = {
      enable = true;
      loadModels = [ "codestral" ];
      acceleration = "rocm";
    };
  };


}
