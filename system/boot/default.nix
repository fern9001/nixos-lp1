{ config, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_5_12;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices = {
      root = {
        device = "/dev/nvme0n1p2";
        preLVM = true;
      };
    };
  };
}
