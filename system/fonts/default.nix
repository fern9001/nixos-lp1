{ config, pkgs, ... }:
{
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      pkgs.monoid
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Monoid" ];
      };
    };
  };
}
