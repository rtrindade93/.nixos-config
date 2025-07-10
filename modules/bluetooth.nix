{
  pkgs,
  ...
} :
{
  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  environment.systemPackages = with pkgs; [ blueman ];

  services.blueman.enable = true;
}
