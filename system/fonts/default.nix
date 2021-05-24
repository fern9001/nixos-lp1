{ config, pkgs, ... }:
{
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      pkgs.monoid
      pkgs.inconsolata-nerdfont
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Monoid" ];
      };
    };
  };
}
