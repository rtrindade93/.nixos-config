{
  pkgs,
  ...
} :
{
  users.users.ricardo = {
    isNormalUser = true;
    description = "Ricardo Trindade";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
  };
}
