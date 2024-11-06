{
  config,
  ...
}:

{
  users.users.${config.values.mainUser} = {
    isNormalUser = true;
    extraGroups = [
      "adbusers"
      "audio"
      "davfs2"
      "docker"
      "i2c"
      "input"
      "libvirtd"
      "networkmanager"
      "power"
      "storage"
      "video"
      "wheel"
    ];
  };

  programs = {
    nix-ld = {
      enable = true;
    };
    nh = {
      enable = true;
      flake = "/home/${config.values.mainUser}/nix-dots";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8081 ];

  # Make hosts mutable but cleaned on switch
  # https://discourse.nixos.org/t/a-fast-way-for-modifying-etc-hosts-using-networking-extrahosts/4190
  environment.etc.hosts.mode = "0644";
}
