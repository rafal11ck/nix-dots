{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    socketActivation = true;
    pulse = {
      enable = true;
    };
    jack = {
      enable = true;
    };
    wireplumber = {
      enable = true;
    };

    extraConfig.pipewire."99-input-denoising" = {
      "context.modules" = [
        {
          "name" = "libpipewire-module-echo-cancel";
          "args" = {
            "library.name" = "aec/libspa-aec-webrtc";
            "node.latency" = "1024/48000";
            "source.props" = {
              "node.name" = "effect_input.echo-cancel";
              "node.description" = "Noise Canceling source";
              "priority.driver" = 10000;
              "priority.session" = 10000;
            };
            "aec.args" = {
              "webrtc.noise_suppression" = true;
              "webrtc.gain_control" = true;
              "webrtc.extended_filter" = false;
              "webrtc.high_pass_filter" = false;
            };
          };
        }
      ];
    };
  };
}
