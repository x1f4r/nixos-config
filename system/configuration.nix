{ config, pkgs, ... }:

{
  # System Identity and Locale
  networking.hostName = "x1f4r-nix";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "de";

  # Bootloader (GRUB with EFI support)
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";

  # CPU microcode and NVIDIA drivers
  boot.cpuMicrocodePackage = pkgs.amd-ucode;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    enable = true;
    modesetting = true;
    cudaSupport = true;
  };

  # Audio: Pipewire configuration
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  hardware.pulseaudio.enable = false;

  # Security: Firewall and Sudo
  security.firewall.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # System packages
  environment.systemPackages = with pkgs; [
    efibootmgr
    zen-browser
    firefox
    librewolf
    google-chrome-beta
    kitty
    fastfetch
    starship
    visual-studio-code
    windsurf
    vlc
    audacity
    gimp
    yacreader
    wine
    bottles
    lm-studio
    git
    vim
    htop
    calibre
    evince
    filezilla
    nextcloud-client
    virtualbox
    docker
    qbittorrent
    steam
    transmission
    blender
    gparted
    NeoWim
    gcc
    kvm
    balena-etcher
    tmux
    geogebra6
    libreoffice-fresh
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
  ];

  # Import hardware configuration from the sibling file
  imports = [ ./hardware-configuration.nix ];
}
