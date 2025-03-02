# NixOS Configuration

This repository contains a fully declarative, reproducible NixOS configuration that uses flakes and Home Manager. This repository provides a complete, ready-to-run system with both system-level and user-level settings.

## Features

- **System Configuration:**
  - Core system settings (hostname, locale, time zone, networking, etc.)
  - Bootloader setup using GRUB with EFI support (with efibootmgr installed)
  - Hardware configuration (filesystems, swap file, microcode, NVIDIA drivers, audio via Pipewire)
  - Preconfigured user accounts (for `root` and `x1f4r` with no sudo password required)
- **Package Management:**
  - A mix of stable (nixos-24.05) and unstable packages (for select applications like Zen Browser, Windsurf, etc.)
  - An overlay ensures select packages are sourced from the unstable channel while the rest remain on stable
- **Home Manager Configuration:**
  - A dedicated Home Manager configuration (located in the `home-manager/` folder) to manage your personal environment
  - Customizations include terminal settings (Kitty, Starship), additional applications, and dotfiles
- **Reproducibility:**
  - Flake-based setup that provides a single source of truth to build your system reproducibly
  - Easily rebuild your system with one command

## Getting Started

### Prerequisites

1. **Fresh NixOS Installation:**\
   Install a minimal version of NixOS. Make sure basic tools like `git` are available.

2. **Flakes Enabled:**\
   Enable flakes in your NixOS configuration (e.g., add the following to your `/etc/nixos/configuration.nix`):

   ```nix
   nix.settings.experimental-features = [ "nix-command" "flakes" ];
   ```

3. **Internet Connection:**\
   Ensure your system has internet access to fetch the required channels and dependencies.

### Cloning the Repository

1. Open a terminal on your fresh NixOS installation.
2. Clone the repository into your desired location:
   ```bash
   git clone https://github.com/x1f4r/nixos-config.git
   ```
3. Change into the repository directory:
   ```bash
   cd nixos-config
   ```

### Using the Configuration

To build and switch to the new configuration, run:

```bash
sudo nixos-rebuild switch --flake .#x1f4r-nix
```

This command will pull in all system-wide and Home Manager configurations, then rebuild your system accordingly.

If you prefer to manage your user environment separately, you can run:

```bash
home-manager switch --flake .#x1f4r
```

### Customization

- **Hardware Configuration:**\
  The file `system/hardware-configuration.nix` is a placeholder. Replace or merge it with the file generated by `nixos-generate-config` for your hardware.

- **Passwords:**\
  The configuration uses dummy password hashes. Generate proper crypt‑style SHA‑512 hashes (e.g., using `mkpasswd -m sha-512 "password"` on a Linux system) and replace the placeholders in `system/users.nix`.

- **Overlays & Packages:**\
  The `overlay.nix` file ensures that specific packages (like Zen Browser, Windsurf, etc.) are sourced from the unstable channel while the rest remain stable. Adjust as needed.

- **Alternative Desktop Environments & Package Removal:**\
  If you prefer a different desktop environment or want to remove certain default packages, you can do so by modifying your configuration or overlays. For instance, you might disable GNOME and enable another DE in your flake or override package sets for more flexibility.

## Troubleshooting

- **Flakes Issues:**\
  Ensure flakes are enabled on your system. Run `nix --version` to confirm you’re on a version that supports flakes.
- **Permissions:**\
  Use `sudo` when running system rebuild commands.
- **Repository Updates:**\
  After making changes, commit them to your repository and update your system using:
  ```bash
  git pull
  sudo nixos-rebuild switch --flake .#x1f4r-nix
  ```

## Contributing

Feel free to fork this repository, open issues, or submit pull requests. For changes specifically to the flake or overlay structure, consider opening a dedicated pull request with details about the modifications. Your contributions will help improve this reproducible NixOS configuration.

