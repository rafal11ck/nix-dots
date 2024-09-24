{

  imports = [
    ./amd.nix
    ./i2c.nix
    ./nvidia.nix
  ];

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
