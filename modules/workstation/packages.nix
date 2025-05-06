{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    iperf
    nautilus
    ffmpegthumbnailer
    wayvnc
    jetbrains.idea-ultimate
    borgbackup
    jaq
  ];
}
