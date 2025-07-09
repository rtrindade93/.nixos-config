{
  config,
  pkgs,
  nixos-hardware,
  ...
}:
{
  imports = [
    nixos-hardware.nixosModules.lenovo-thinkpad-t490
    ./hardware-configuration.nix
    ../../modules/nix.nix
    ../../modules/i18n.nix
    ../../modules/user.nix
    ../../modules/home-manager.nix

    # User variables  
    ./variables.nix
];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Set hostname.
  networking.hostName = config.var.hostname;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
 
  # Graphical acceleration support
  hardware.graphics.enable = true;

  # Enable zram
  zramSwap.enable = true;

  # Import home manager config.
  home-manager.users."${config.var.username}" = import ./home.nix;
}
