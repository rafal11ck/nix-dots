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

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];

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
