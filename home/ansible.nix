{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    ansible-lint
    python311Packages.ansible-core
  ];
}
