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

  fileSystems."/media/storage" = {
    device = "/dev/disk/by-uuid/01eaf25a-4b5b-440a-824f-4508cd183665";
    fsType = "btrfs";
    options = [ "subvol=data" ];
  };

  nixpkgs.config = {
    rocmSupport = true;
  };

  environment.sessionVariables = {
    AQ_DRM_DEVICES = "/dev/dri/by-path/pci-0000:03:00.0-card";
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  services = {
    ollama = {
      enable = true;
      loadModels = [
        "lfm2"
        "qwen3.5"
        "nemotron-cascade-2"
      ];
      environmentVariables = {
        HSA_OVERRIDE_GFX_VERSION = "11.0.2";
      };
      host = "0.0.0.0";
      # openFirewall = true;
    };

    xserver.videoDrivers = [
      "amdgpu"
    ];

    udev.extraHwdb = ''
      evdev:input:b0003v0C45p8513*
        KEYBOARD_KEY_c0401=reserved
    '';

  };

  hardware = {

    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
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
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };

}
