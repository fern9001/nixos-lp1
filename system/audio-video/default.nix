{ pkgs, config, ... }:
{

  sound.enable = true;

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

  services.xserver = {
    enable = true;
    dpi    = 96;
    videoDrivers = [ "modesetting" ];
    layout = "us";
    xkbOptions = "caps:swapescape";
    libinput.enable = true;
    displayManager.defaultSession = "none+xmonad";
    windowManager.xmonad = {
      config = builtins.readFile ./xmonad/xmonad.hs;
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hpkgs: [
        hpkgs.xmonad-contrib
        hpkgs.xmonad-extras
        hpkgs.xmonad-wallpaper
        hpkgs.xmonad
        hpkgs.xmobar
      ];
    };
  };

}
