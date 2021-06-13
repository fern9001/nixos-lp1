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
          "emmet-vim"
          "horizon"
          "indentLine"
          "nerdtree"
          "nerdtree-git-plugin"
          "photon"
          "typescript-vim"
          "vim-airline"
          "vim-airline-themes"
          "vim-commentary"
          "vim-devicons"
          "vim-javascript"
          "vim-nerdtree-syntax-highlight"
          "vim-nix"
          "vim-one"
          "vim-signify"
          "vim-surround"
          "vim-tmux"
          "vim-unimpaired"
        ];}
      ];
    };
  };
in {
  environment.systemPackages = with pkgs; [ myVim ];
  environment.variables = { EDITOR = "vim"; };
}
