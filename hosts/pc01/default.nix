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
    hostName = "pc01";
    firewall.allowedTCPPorts = [ 5900 ];

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

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

    opengl.extraPackages = with pkgs; [
      rocmPackages.clr.icd # following for GPU AI acceleration
      rocmPackages.rocm-smi
      rocmPackages.clr
      rocmPackages.hipblas
      rocmPackages.rocblas
      rocmPackages.rocsolver
      rocmPackages.rocm-comgr
      rocmPackages.rocm-runtime
      rocmPackages.rocsparse
    ];

  };

}
