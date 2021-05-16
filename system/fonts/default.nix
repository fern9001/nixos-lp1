{ config, pkgs, ... }:
{
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      pkgs.monoid
      pkgs.powerline-fonts
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Monoid" ];
      };
    };
  };
}
