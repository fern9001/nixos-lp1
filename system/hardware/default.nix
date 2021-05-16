{ pkgs, config, ... }:
{
  hardware = {
    pulseaudio.enable = true;
    nvidia = {
      modesetting.enable = true;
      prime = {
        sync.enable = true;
        nvidiaBusId = "PCI:2:0:0";
        intelBusId  = "PCI:0:2:0";
      };
    };
  };
}
