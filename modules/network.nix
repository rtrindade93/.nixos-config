{
  config,
  pkgs,
  ...
} : 
{
  # Set hostname.
  networking.hostName = config.var.hostname;

  # Enable networking
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanagerapplet
  ];
}
