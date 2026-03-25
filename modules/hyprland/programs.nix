{
  inputs,
  ...
}:
{

  imports = [ inputs.dms-plugin-registry.modules.default ];

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    dms-shell = {
      enable = true;

      plugins = {
        dankBatteryAlerts.enable = true;
        dankKDEConnect.enable = true;
        nixMonitor.enable = true;
      };
    };
  };
}
