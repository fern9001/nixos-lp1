{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    tmux 
    tmuxPlugins.gruvbox 
  ];
  programs.tmux = {  
    enable = true;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    extraConfig = builtins.readFile ./.tmux.conf;
    baseIndex = 1;
    clock24 = true;
  };
}
