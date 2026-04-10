{pkgs, config, ...}:
let
  nvimPath = "${config.home.homeDirectory}/zixos";
in {
  programs.neovim = {
    enable = true;
	  defaultEditor = true;
		extraName = "nim";

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
    extraPackages = with pkgs;[
      fzf
      ripgrep

      lua-language-server
      stylua

      nixd
      nixfmt

      prettier
    ];
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${nvimPath}/nvim";
}
