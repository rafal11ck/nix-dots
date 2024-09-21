{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    hunspell
    hunspellDicts.pl_PL # Polish dictionary
    hunspellDicts.en_US # English dictionary
  ];
}
