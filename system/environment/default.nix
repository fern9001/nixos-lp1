{ config, pkgs, ... }:
{
  environment.etc."xdg/gtk-3.0".source = ./gtk-3.0;
  environment.systemPackages = with pkgs; [
    google-chrome
    vscode
    nasm
    acpilight
    bmon
    deno
    dmenu
    emacs
    feh
    firefox
    fzf
    geckodriver
    git
    htop
    konsole
    libreoffice
    neofetch
    networkmanagerapplet
    nix-prefetch-github
    nixops
    nodejs-14_x
    openssl
    protonvpn-cli
    pulseeffects-legacy
    rakudo
    ranger
    rtv
    scim
    sqlite
    termite
    termshark
    tmuxinator
    tshark
    vim
    wavemon
    wget
    which
    # wordpress
    xmobar
    xorg.xbacklight
    xsel
  ];
}
