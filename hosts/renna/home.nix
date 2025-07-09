{
  config,
  pkgs,
  ...
} :
{
  imports = [
    ./variables.nix
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = null;
      videos = null;
      desktop = null;
      download = "${config.home.homeDirectory}/Downloads";
      pictures = "${config.home.homeDirectory}/Pictures";
      documents = "${config.home.homeDirectory}/Documents";
      templates = null;
      publicShare = null;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
        XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
      };
    };
  };

  home.packages = with pkgs; [
    chromium
    brave
    neovim
    gcc
    lazygit
    vscodium
    fastfetch
    dotnet-sdk_9
    starship
    tmux
    unzip
    nodejs
    cargo
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
