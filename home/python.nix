{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (python3.withPackages (python-pkgs: [
      # select Python packages here
      python-pkgs.numpy
      python-pkgs.pygments
    ]))

  ];
}
