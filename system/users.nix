{ config, pkgs, ... }:

{
  # Replace the dummy hashes with a proper crypt-style SHA-512 hash
  users.users.root.initialHashedPassword = "$6$rounds=656000$dummySalt$dummyHashForRoot";
  users.users.x1f4r = {
    isNormalUser = true;
    password = "$6$rounds=656000$dummySalt$dummyHashForUser";
    extraGroups = [ "wheel" "audio" "video" ];
    home = "/home/x1f4r";
    shell = pkgs.zsh;
  };
}
