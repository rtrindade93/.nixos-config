{ 
  config, 
    pkgs, 
    ... 
}:
let 
  username = config.var.username;
  description = config.var.description;
  extraGroups = config.var.extraGroups;
in {
  programs.zsh.enable = true;
  
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = description;
      extraGroups = extraGroups;
    };
  };
}
