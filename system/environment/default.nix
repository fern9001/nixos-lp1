{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    acpilight
    bmon
    dmenu
    feh
    fzf
    geckodriver
    git
    htop
    libreoffice
    neofetch
    networkmanagerapplet
    nix-prefetch-github
    nodejs-14_x
    openssl
    protonvpn-cli
    rakudo
    ranger
    rtv
    scim
    sqlite
    termite
    vim
    wavemon
    wget
    which
    xmobar
    xorg.xbacklight
    xsel

    firefox
    pulseeffects-legacy
  ];
}
