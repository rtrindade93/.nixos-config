{
  pkgs,
  ...
} :
{
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
    })
  ];

  # Activate sddm services
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };

  # Allow graphical login
  services.displayManager.autoLogin.enable = false;
}
