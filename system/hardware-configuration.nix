{ config, lib, pkgs, ... }:

{
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/swapfile"; size = 33000; }
  ];
}
