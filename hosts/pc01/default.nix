{
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
    networkmanager.wifi.powersave = false;
  };

  fileSystems."/media/storage" = {
    device = "/dev/disk/by-uuid/01eaf25a-4b5b-440a-824f-4508cd183665";
    fsType = "btrfs";
    options = [ "subvol=data" ];
  };

  nixpkgs.config = {
    rocmSupport = true;
  };

  services = {
    ollama = {
      enable = true;
      loadModels = [
        "qwen3.8"
      ];
      environmentVariables = {
        HSA_OVERRIDE_GFX_VERSION = "11.0.2";
        OLLAMA_CONTEXT_LENGTH = "64000";
      };
      host = "0.0.0.0";
    };

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
        rocmPackages.rocm-smi
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

  system.stateVersion = "24.05";
}
