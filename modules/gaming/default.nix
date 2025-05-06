{
  pkgs,
  ...
}:

{
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pkgs.steam-run
    heroic
    mangohud
    nix-alien
    prismlauncher
  ];
}
