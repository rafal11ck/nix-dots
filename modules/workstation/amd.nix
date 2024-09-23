{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware = {
    amdgpu.initrd.enable = lib.mkDefault true;

    graphics = {
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
      enable32Bit = true;
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    clinfo # To check openCL is setup correctly.
  ];

}
