{
  pkgs,
  inputs,
  ...
}:

{
  # https://github.com/nix-community/home-manager/issues/1011#issuecomment-1762468457
  environment.extraInit =
    let
      homeManagerSessionVars = "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh";
    in
    "[[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars}";

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
    inputs.caelestia-cli.packages.${pkgs.system}.with-shell
    inputs.caelestia-shell.packages.${pkgs.system}.caelestia-shell
  ];
}
