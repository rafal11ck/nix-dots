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

  # TODO https://github.com/gmodena/nix-flatpak
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo";
  };
}
