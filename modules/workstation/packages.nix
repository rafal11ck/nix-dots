{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    iperf
  ];
}
