{
  config,
  ...
}:

{
  # Brings up ./docker-compose.yaml at boot, so a freshly installed system
  # starts ComfyUI without anyone running compose.
  # The compose file is read from the checkout, so editing it needs no rebuild.
  systemd.services.comfyui-compose = {
    description = "ComfyUI (docker compose)";
    wantedBy = [ "multi-user.target" ];
    requires = [ "docker.service" ];
    after = [
      "docker.service"
      "network-online.target"
    ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      WorkingDirectory = "/home/${config.values.mainUser}/nix-dots/hosts/pc01/comfyui";
      # --pull missing: only download images that are not there yet, so a boot
      # without network still works and booting never upgrades anything.
      ExecStart = "${config.virtualisation.docker.package}/bin/docker compose up -d --pull missing";
    };
  };
}
