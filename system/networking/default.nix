{ config, ... }:
{
  networking = {
    hostName = "LP1";
    enableIPv6 = false;
    useDHCP = false;
    interfaces.enp0s20f0u1.useDHCP = true;
    interfaces.enp3s0.useDHCP = true;
    interfaces.wlp4s0.useDHCP = true;
    networkmanager.enable = true;
  };
}
