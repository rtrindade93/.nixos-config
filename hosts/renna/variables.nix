{
  lib,
  ...
}: 
{
  config.var = {
    hostname = "renna";
    username = "ricardo";
    description = "Ricardo Trindade";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
