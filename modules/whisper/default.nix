{
  pkgs,
  ...
}:

let
  whisperVulkan = pkgs.whisper-cpp.override {
    rocmSupport = false;
    vulkanSupport = true;
  };
in
{
  environment.systemPackages = [
    whisperVulkan
  ];
}
