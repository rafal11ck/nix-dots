{
  pkgs,
  ...
}:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  environment.systemPackages = with pkgs; [
    pkgs.steam-run
    heroic
  ];
}
