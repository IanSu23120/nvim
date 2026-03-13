{pkgs, config, ...}:
let
  nvimPath = "${config.home.homeDirectory}/zixos";
in {
  programs.neovim = {
    enable = true;
	defaultEditor = true;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${emacsPath}/nvim";
}