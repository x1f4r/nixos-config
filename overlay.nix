{ nixpkgsUnstable, system, ... }:
self: super: {
  zen-browser          = (import nixpkgsUnstable { inherit system; }).zen-browser;
  firefox              = (import nixpkgsUnstable { inherit system; }).firefox;
  librewolf            = (import nixpkgsUnstable { inherit system; }).librewolf;
  google-chrome-beta   = (import nixpkgsUnstable { inherit system; }).google-chrome-beta;
  kitty                = (import nixpkgsUnstable { inherit system; }).kitty;
  fastfetch            = (import nixpkgsUnstable { inherit system; }).fastfetch;
  starship             = (import nixpkgsUnstable { inherit system; }).starship;
  visual-studio-code   = (import nixpkgsUnstable { inherit system; }).visual-studio-code;
  windsurf             = (import nixpkgsUnstable { inherit system; }).vscode;
  vlc                  = (import nixpkgsUnstable { inherit system; }).vlc;
  audacity             = (import nixpkgsUnstable { inherit system; }).audacity;
  gimp                 = (import nixpkgsUnstable { inherit system; }).gimp;
  yacreader            = (import nixpkgsUnstable { inherit system; }).yacreader;
  wine                 = (import nixpkgsUnstable { inherit system; }).wine;
  bottles              = (import nixpkgsUnstable { inherit system; }).bottles;
  lm-studio            = (import nixpkgsUnstable { inherit system; }).lm-studio;
  filezilla            = (import nixpkgsUnstable { inherit system; }).filezilla;
  nextcloud-client     = (import nixpkgsUnstable { inherit system; }).nextcloud-client;
  virtualbox           = (import nixpkgsUnstable { inherit system; }).virtualbox;
  docker               = (import nixpkgsUnstable { inherit system; }).docker;
  qbittorrent          = (import nixpkgsUnstable { inherit system; }).qbittorrent;
  steam                = (import nixpkgsUnstable { inherit system; }).steam;
  transmission         = (import nixpkgsUnstable { inherit system; }).transmission;
  blender              = (import nixpkgsUnstable { inherit system; }).blender;
  gparted              = (import nixpkgsUnstable { inherit system; }).gparted;
  NeoWim               = (import nixpkgsUnstable { inherit system; }).NeoWim;
  gcc                  = (import nixpkgsUnstable { inherit system; }).gcc;
  kvm                  = (import nixpkgsUnstable { inherit system; }).kvm;
  balena-etcher        = (import nixpkgsUnstable { inherit system; }).balena-etcher;
}
