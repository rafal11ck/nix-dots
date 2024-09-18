{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.tofi = {
    enable = true;
  };

  xdg.configFile."tofi" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/tofi/.config/tofi";
  };

  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };
}
