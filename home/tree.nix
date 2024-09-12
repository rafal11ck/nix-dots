{
  pkgs,
  ...
}:
{
  home.pkgs = [ pkgs.tree ];
}
