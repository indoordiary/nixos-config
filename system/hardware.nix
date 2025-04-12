{ pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };

    graphics.enable = true;

    amdgpu = {
      amdvlk.enable = true;
      initrd.enable = true;
      opencl.enable = true;
    };
  };

  services.blueman.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
}
