{
  config,
  lib,
  pkgs,
  ...
}:

{
  #Dictionarty server
  services.dictd = {
    enable = true;
  };
}
