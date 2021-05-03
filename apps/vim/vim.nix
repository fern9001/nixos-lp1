{ pkgs, ...}:

with pkgs; 

let myVim = vim_configurable.customize {
  name = "vim";
  vimrcConfig = {
    customRC = builtins.readFile ./.vimrc;
    vam.knownPlugins = pkgs.vimPlugins // import ./vimPlugins.nix;
    vam.pluginDictionaries = [
      { names = [
          "photon"
          "horizon" 
          "ale"
          "indentLine"
          "nerdtree"
          "vim-one"
          "vim-surround"
          "vim-commentary"
          "vim-nix"
          "vim-airline"
          "vim-airline-themes"
          "vim-signify"
          "vim-tmux"
        ];}
      ]; 
    };
  };
in { environment.systemPackages = with pkgs; [ myVim ]; }
