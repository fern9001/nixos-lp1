{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports =
    [
      ./hardware-configuration.nix
      ./apps/vim/vim.nix
      ./apps/termite/termite.nix
      ./apps/tmux/tmux.nix
      ./apps/zsh/zsh.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_5_11;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/nvme0n1p2";
      preLVM = true;
    };
  };

  networking.hostName = "LP1"; 

  time.timeZone = "Australia/Brisbane";

  networking.useDHCP = false;
  networking.interfaces.enp0s20f0u1.useDHCP = true;
  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;
  networking.networkmanager.enable = true;

  # FONTS
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

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:2:0:0";
      intelBusId  = "PCI:0:2:0";
    };
  };

  services.xserver.enable = true;
  services.xserver.dpi    = 96;
  services.xserver.videoDrivers = [ "modesetting" ];
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "caps:swapescape";
  services.xserver.libinput.enable = true;
  services.xserver.displayManager.defaultSession = "none+xmonad";
  services.xserver.windowManager.xmonad = {
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

  users.users.fern = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    home = "/home/fern";
    group = "users";
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  environment.systemPackages = with pkgs; [
    pulseeffects
    openssl
    sqlite
    ranger
    dmenu
    fzf
    acpilight
    firefox
    git
    htop
    neofetch
    networkmanagerapplet
    rtv
    termite
    vim
    wget 
    which
    xmobar
    xorg.xbacklight
  ];

  system.stateVersion = "20.09";

}
