{
  pkgs,
  config,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [

    iperf
    nautilus

    (flameshot.override { enableWlrSupport = true; })
    (python3.withPackages (
      python-pkgs: with python-pkgs; [
        # select Python packages here
        numpy
        pygments
        isort
        matplotlib
      ]
    ))

    freecad
    android-tools
    aria2
    asciinema
    asciinema-agg
    brightnessctl
    ddcutil
    dict
    dig
    ffmpeg
    gammastep
    gcc
    gimp3
    gnuplot
    go-task
    grim
    httpie
    hunspell
    hunspellDicts.en_US # English dictionary
    hunspellDicts.pl_PL # Polish dictionary
    inkscape
    iosevka
    jellyfin-media-player
    jellyfin-mpv-shim
    jq
    keepassxc
    krew
    kubectl
    kubectl-explore
    kubectx
    kubernetes-helm
    less
    libnotify
    libreoffice
    material-design-icons
    megatools
    mermaid-cli
    mise
    ncdu
    neovim
    networkmanagerapplet
    nix-output-monitor
    nixd
    nmap
    nsxiv
    nvtopPackages.full
    p7zip-rar
    pandoc
    payload-dumper-go
    plantuml
    playerctl
    pulsemixer
    pwvucontrol
    qbittorrent
    qpdf
    scrcpy
    shellcheck
    shfmt
    slurp
    smartmontools
    stow
    svp
    swappy
    syncplay
    talosctl
    termdown
    texliveFull
    thunderbird
    tree
    unzip
    uv
    vesktop
    virt-manager
    virt-viewer
    OVMF
    wev
    wireguard-tools
    wl-clipboard
    wlogout
    yazi
    yt-dlp
    zathura
    zellij
    zip
    fluxcd-operator-mcp

    wayvnc
    jetbrains.idea-ultimate
    borgbackup
    jaq

    wineWowPackages.stable
    docker-compose
    pydf
    tesseract

    papirus-icon-theme
    hicolor-icon-theme
    material-symbols

    (catppuccin-papirus-folders.override {
      accent = (lib.strings.toLower config.values.catppuccinAccent);
      flavor = (lib.strings.toLower config.values.catppuccinFlavor);
    })
    adwaita-icon-theme
    kdePackages.breeze

    pv-migrate

    darkly
    darkly-qt5

    #caelstia dots need those
    hyprpicker
    hypridle
    wl-clipboard
    cliphist
    bluez
    bluez-tools
    inotify-tools
    app2unit
    wireplumber
    trash-cli
    foot
    fish
    fastfetch
    starship
    btop
    jq
    socat
    imagemagick
    curl
    adw-gtk3
    papirus-icon-theme
    kdePackages.qt6ct
    libsForQt5.qt5ct
    nerd-fonts.jetbrains-mono
  ];
}
