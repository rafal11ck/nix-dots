{
  config,
  inputs,
  flakePkgs,
  pkgs,
  ...
}:
{
  imports = [ inputs.kokoro-tts.nixosModules.default ];

  programs = {
    kokoro-tts.enable = true;
    
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "foot";
    };

    ssh = {
      startAgent = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        glib
        gtk3
        pango
        cairo
        gdk-pixbuf
        atk
        at-spi2-atk
        nss
        nspr
        dbus
        cups
        expat
        fontconfig
        alsa-lib
        libglvnd
        libpulseaudio
        libx11
        libxcomposite
        libxcursor
        libxdamage
        libxext
        libxfixes
        libxi
        libxrandr
        libxrender
        libxtst
        libxscrnsaver
        libxcb
      ];
    };
    nh = {
      enable = true;
      flake = "/home/${config.values.mainUser}/nix-dots";
    };
    kdeconnect.enable = true;
    openvpn3 = {
      enable = true;
      package = flakePkgs.nixpkgs-stable.openvpn3;
    };
  };
}
