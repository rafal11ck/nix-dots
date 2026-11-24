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
  networking.firewall.allowedTCPPorts = [ 8188 ];

  systemd.sockets.comfyui-proxy = {
    description = "ComfyUI on-demand socket";
    wantedBy = [ "sockets.target" ];
    listenStreams = [ "8188" ];
  };

  systemd.services.comfyui-proxy = {
    description = "ComfyUI on-demand proxy";
    bindsTo = [ "comfyui-compose.service" ];
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
      Type = "exec";
      WorkingDirectory = dir;
      ExecStart = "${docker} compose up --pull missing --exit-code-from comfyui";
      ExecStartPost = "${pkgs.curl}/bin/curl --silent --fail --output /dev/null --retry-all-errors --retry 3600 --retry-delay 1 --retry-max-time 3600 http://127.0.0.1:18188/system_stats";
      ExecStop = "${docker} compose stop";
      SuccessExitStatus = "130 137 143";
      TimeoutStartSec = "1h";
    };
  };
}
