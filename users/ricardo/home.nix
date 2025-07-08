{
  config,
  pkgs,
  ...
} :
{
  home.username = "ricardo";
  home.homeDirectory = "/home/ricardo";

  home.packages = with pkgs; [
    zsh
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
