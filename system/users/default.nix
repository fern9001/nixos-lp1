{ config, ... }:
{
  users.users.fern = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    home = "/home/fern";
    group = "users";
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };
}
