{ config, pkgs, ... }:

{
  home.username = "x1f4r";
  home.homeDirectory = "/home/x1f4r";

  programs.home-manager.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      prompt_order = [ "username" "hostname" "directory" "git_branch" "git_state" ];
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      font_family FiraCode
      font_size 12.0
      background dark
    '';
  };

  xdg.configFile."mimeapps.list".text = ''
    [Default Applications]
    x-scheme-handler/http=zen-browser.desktop
    x-scheme-handler/https=zen-browser.desktop
  '';

  home.packages = with pkgs; [
    kitty
    starship
    firefox
    librewolf
    google-chrome-beta
    visual-studio-code
    windsurf
    fastfetch
    neofetch
    gnome-tweaks
  ];
}
