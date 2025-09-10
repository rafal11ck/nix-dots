{ pkgs, ... }:
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
    hyprlock
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

    wayvnc
    jetbrains.idea-ultimate
    borgbackup
    jaq

  ];

}
