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

  boot.initrd.kernelModules = [ "amdgpu" ];

  services = {
    ollama = {
      enable = true;
      loadModels = [ "codestral" ];
      acceleration = "rocm";
    };

    xserver.videoDrivers = [
      "amdgpu"
      "nvidia"
    ];
  };


  hardware = {
    nvidia = {
      powerManagement.finegrained = false;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };

    amdgpu = {
      initrd.enable = true;
    };

    graphics = {
      enable32Bit = true;
      enable = true;
    };
  };

}
