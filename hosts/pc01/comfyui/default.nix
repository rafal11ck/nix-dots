{
  config,
  pkgs,
  ...
}:

let
  dir = "/home/${config.values.mainUser}/nix-dots/hosts/pc01/comfyui";
  docker = "${config.virtualisation.docker.package}/bin/docker";
in
{
  # ComfyUI runs only while something uses it:
  #   - systemd listens on :8188 (comfyui-proxy.socket),
  #   - the first connection starts comfyui-proxy, which starts comfyui-compose
  #     and forwards traffic to the container on 127.0.0.1:18188,
  #   - after 30 min without connections the proxy exits, and comfyui-compose
  #     (StopWhenUnneeded) stops the container.
  # The compose file is read from the checkout, so editing it needs no rebuild.

  networking.firewall.allowedTCPPorts = [ 8188 ];

  systemd.sockets.comfyui-proxy = {
    description = "ComfyUI on-demand socket";
    wantedBy = [ "sockets.target" ];
    listenStreams = [ "8188" ];
  };

  systemd.services.comfyui-proxy = {
    description = "ComfyUI on-demand proxy";
    requires = [ "comfyui-compose.service" ];
    after = [ "comfyui-compose.service" ];
    serviceConfig.ExecStart = "${config.systemd.package}/lib/systemd/systemd-socket-proxyd --exit-idle-time=30min 127.0.0.1:18188";
  };

  systemd.services.comfyui-compose = {
    description = "ComfyUI (docker compose)";
    requires = [ "docker.service" ];
    after = [
      "docker.service"
      "network-online.target"
    ];
    wants = [ "network-online.target" ];
    unitConfig.StopWhenUnneeded = true;
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      WorkingDirectory = dir;
      # --pull missing: only download images that are not there yet, so a start
      # without network still works and starting never upgrades anything.
      ExecStart = "${docker} compose up -d --pull missing";
      # Hold the first connection until ComfyUI answers, instead of letting it fail.
      ExecStartPost = "${pkgs.curl}/bin/curl --silent --fail --output /dev/null --retry-all-errors --retry 3600 --retry-delay 1 --retry-max-time 3600 http://127.0.0.1:18188/system_stats";
      ExecStop = "${docker} compose stop";
      # A fresh system pulls a ~20 GB image and downloads models on first start.
      TimeoutStartSec = "1h";
    };
  };
}
