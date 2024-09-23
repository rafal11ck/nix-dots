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

    opengl = {
      driSupport32Bit = true; # Turn on vulcan for 32bit apps.

      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    clinfo # To check openCL is setup correctly.
  ];

}
