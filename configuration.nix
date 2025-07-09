# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  services.blueman.enable = true;

  # Activate essential services
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };

  # Activate Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.xfconf.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # Pipewire for audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    networkmanager
    hyprland
    hyprlock
    waybar
    hyprpaper
    hypridle
    hyprshot
    wofi
    kitty
    wl-clipboard
    networkmanagerapplet
    lshw
    catppuccin-cursors.mochaLight
    clipman
    xfce.thunar
    mako
    (catppuccin-sddm.override {
      flavor = "mocha";
    })
    catppuccin-gtk
  ];

  # Allow graphical login
  services.displayManager.autoLogin.enable = false;

  programs.zsh = {
    enable = true;
  };

  # Environment variables
  environment.sessionVariables = {
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
