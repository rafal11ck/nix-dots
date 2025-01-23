{
  config,
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
  };

  nixpkgs.config = {
    rocmSupport = true;
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  services = {
    ollama = {
      enable = true;
      loadModels = [
        "codestral"
        "deepseek-r1:14b"
        "deepseek-r1:32b"
      ];
      acceleration = "rocm";
      environmentVariables = {
        HSA_OVERRIDE_GFX_VERSION = "11.0.0";
      };
      host = "0.0.0.0";
      openFirewall = true;
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

      extraPackages = with pkgs; [
        rocmPackages.rocm-runtime
        rocmPackages.clr.icd # following for GPU AI acceleration
        rocmPackages.rocm-smi
        rocmPackages.clr
        rocmPackages.hipblas
        rocmPackages.rocblas
        rocmPackages.rocsolver
        rocmPackages.rocm-comgr
        rocmPackages.rocsparse
        libva
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

  };
}
