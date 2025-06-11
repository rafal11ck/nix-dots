{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    iperf
    nautilus

    wayvnc
    jetbrains.idea-ultimate
    borgbackup
    jaq
  ];
}
