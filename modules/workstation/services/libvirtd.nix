{
  config,
  lib,
  pkgs,
  ...
}:

{
  #NOTE to enable network bridge run: virsh net-autostart default
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true;
}
