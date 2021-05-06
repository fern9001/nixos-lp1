{ pkgs, ...}:

with pkgs; 

let myVim = vim_configurable.customize {
  name = "vim";
  vimrcConfig = {
    customRC = builtins.readFile ./.vimrc;
    vam.knownPlugins = pkgs.vimPlugins // import ./vimPlugins.nix;
    vam.pluginDictionaries = [
      { names = [
          "ale"
          "coc-nvim"
          "horizon" 
          "indentLine"
          "nerdtree"
          "nerdtree-git-plugin"
          "photon"
          "vim-airline"
          "vim-airline-themes"
          "vim-commentary"
          "vim-nerdtree-syntax-highlight"
          "vim-nix"
          "vim-one"
          "vim-signify"
          "vim-surround"
          "vim-tmux"
        ];}
      ]; 
    };
  };
in { environment.systemPackages = with pkgs; [ myVim ]; }
