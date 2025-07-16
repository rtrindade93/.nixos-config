{
  config,
  pkgs,
  nixos-hardware,
  ...
}:
{
  imports = [
    # Hardware configurations
    nixos-hardware.nixosModules.lenovo-thinkpad-t490
    ./hardware-configuration.nix

    # Host variables
    ./variables.nix

    # Nix Modules
    ../../modules/nix.nix
    ../../modules/i18n.nix
    ../../modules/network.nix
    ../../modules/audio.nix
    ../../modules/bluetooth.nix
    ../../modules/fonts.nix
    ../../modules/user.nix
    ../../modules/home-manager.nix
    ../../modules/sddm.nix
    ../../modules/envVars.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
 
  # Graphical acceleration support
  hardware.graphics.enable = true;

  # Enable zram
  zramSwap.enable = true;

  # Import home manager config.
  home-manager.users."${config.var.username}" = import ./home.nix;
}
