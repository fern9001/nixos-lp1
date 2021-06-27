{ config, pkgs, ... }:
{
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
        hpkgs.xmonad
        hpkgs.xmobar
      ];
    };
  };
}
