{pkgs, config, ...}:
let
  nvimPath = "${config.home.homeDirectory}/zixos";
in {
  programs.neovim = {
    enable = true;
	  defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${nvimPath}/nvim";
}
