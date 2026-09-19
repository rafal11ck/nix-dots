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

    android-tools
    aria2
    asciinema
    asciinema-agg
    borgbackup
    brightnessctl
    claude-code
    ddcutil
    dict
    dig
    discord
    docker-compose
    ffmpeg-full
    fluxcd-operator-mcp
    gammastep
    gcc
    gimp3
    go
    gnuplot
    gh
    go-task
    grim
    hicolor-icon-theme
    httpie
    hunspell
    hunspellDicts.en_US # English dictionary
    hunspellDicts.pl_PL # Polish dictionary
    inkscape
    iosevka
    jaq
    jdk25
    jellyfin-mpv-shim
    jetbrains.goland
    jetbrains.idea
    jetbrains.rider
    jq
    kdePackages.okular
    krew
    kubectl
    kubectl-explore
    kubectx
    kubernetes-helm
    ksnip
    less
    libnotify
    libreoffice
    material-design-icons
    material-symbols
    megatools
    mermaid-cli
    mise
    ncdu
    neovim
    nix-output-monitor
    nixd
    nixfmt
    nmap
    nsxiv
    nvtopPackages.full
    opencode
    openssh-askpass
    openssl
    OVMF
    p7zip-rar
    pandoc
    payload-dumper-go
    plantuml
    playerctl
    pulsemixer
    pwvucontrol
    pydf
    r2modman
    qbittorrent
    qpdf
    rustnet
    scrcpy
    shellcheck
    shfmt
    slurp
    smartmontools
    snitch
    sox
    stow
    svp
    swappy
    syncplay
    talosctl
    termdown
    tesseract
    texliveFull
    thunderbird
    tree
    unzip
    uv
    vesktop
    virt-manager
    virt-viewer
    wayvnc
    wev
    wineWow64Packages.stable
    wireguard-tools
    wl-clipboard
    wlogout
    yazi
    yt-dlp
    zathura
    zellij
    zip

    # papirus-icon-theme
    (catppuccin-papirus-folders.override {
      accent = (lib.strings.toLower config.values.catppuccinAccent);
      flavor = (lib.strings.toLower config.values.catppuccinFlavor);
    })
    adwaita-icon-theme
    kdePackages.breeze

    pv-migrate

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
    kdePackages.qt6ct
    libsForQt5.qt5ct
    nerd-fonts.jetbrains-mono
    (pkgs.mpv.override {
      scripts = with mpvScripts; [
        mpris
        mpv-cheatsheet-ng
      ];
    })

  ];

  environment.variables = {
    NIX_REMOTE = "daemon";
  };

  environment.sessionVariables = {
    RUSTICL_ENABLE = "radeonsi";
    OCL_ICD_VENDORS = "${pkgs.mesa.opencl}/etc/OpenCL/vendors";
  };

  security.wrappers.rustnet = {
    owner = "root";
    group = "wheel";
    permissions = "u+rx,g+x,o-rwx";
    capabilities = "cap_net_raw,cap_net_admin,cap_bpf,cap_perfmon+ep";
    source = "${pkgs.rustnet}/bin/rustnet";
  };

}
