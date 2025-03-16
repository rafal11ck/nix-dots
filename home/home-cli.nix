{
  pkgs,
  config,
  ...
}:
let
  values = config.values;
in
{
  imports = [
    ./values.nix
    ./shared.nix

    ./style

    ./python.nix
  ];

  home.packages = with pkgs; [
    android-tools
    kubectl
    kubectx
    dig
    gnuplot
    jq
    less
    nix-output-monitor
    qpdf
    unzip
    zip
    wireguard-tools
    gcc
    stow
    payload-dumper-go
    plantuml
    smartmontools
    inkscape
    kubernetes-helm
    yt-dlp
    talosctl
    mise
    go-task
    yazi
    httpie
    asciinema
    asciinema-agg
    aria2
    dict
    hunspell
    hunspellDicts.pl_PL # Polish dictionary
    hunspellDicts.en_US # English dictionary
    megatools
    ncdu
    neovim
    nixd
    nmap
    nvtopPackages.full
    p7zip
    pandoc
    playerctl
    pulsemixer
    shellcheck
    shfmt
    termdown
    tree
    zellij
    texliveFull
  ];

  programs = {
    bash.enable = true;
    bat.enable = true;
    btop = {
      enable = true;
    };
    direnv = {
      enable = true;
    };
    fd = {
      enable = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
    k9s = {
      enable = true;
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    ripgrep = {
      enable = true;
    };
    gitui = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "${values.mainUser}";
      userEmail = "you@example.com";

      extraConfig = {
        pull = {
          rebase = true;
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };
  };

  nix = {
    gc.automatic = true;
  };

  services.ssh-agent = {
    enable = true;
  };

  home.sessionPath = [
    "$HOME/.config/scripts/path"
  ];

}
