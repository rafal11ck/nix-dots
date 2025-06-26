{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    docker-compose
    pydf
  ];
}
