{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    iperf
    nautilus
    ffmpegthumbnailer
  ];
}
