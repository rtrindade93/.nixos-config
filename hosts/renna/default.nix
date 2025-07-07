{
  pkgs,
  nixos-hardware,
  ...
}:
{
  imports = [
    nixos-hardware.nixosModules.lenovo-thinkpad-t490
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "renna";

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
}
