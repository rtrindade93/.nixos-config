{
  pkgs,
  ...
} :
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.ubuntu-sans
      nerd-fonts.ubuntu

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      font-awesome

      nerd-fonts.jetbrains-mono
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Ubuntu Serif" ];
        sansSerif = [ "Ubuntu" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
