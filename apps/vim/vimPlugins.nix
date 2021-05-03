with import <nixpkgs> {};

let inherit (vimUtils) buildVimPluginFrom2Nix; in {
  
  "horizon" = buildVimPluginFrom2Nix {
    name = "horizon";
    src = fetchgit {
      url = "https://github.com/ntk148v/vim-horizon";
      rev = "ca8ca90d14190aeadc352cf9f89c3508c304ec02";
      sha256 = "1qwrybl6f0mc57r7bj9x393536inv2pcccy5lc3g663z4k1dixfr";
    };
  };

  "photon" = buildVimPluginFrom2Nix {
    name = "photon";
    src = fetchgit {
      url = "https://github.com/axvr/photon.vim.git";
      rev = "046b79c2c210c126575f34a1d96ee66d293e594b";
      sha256 = "1hz3m0yz06cgwyrs9v9hxm8cx7lsr4pgn0livpxz62d69cp09c0z";
    };
  };
}
