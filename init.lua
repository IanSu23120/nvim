require("config")
vim.cmd("colorscheme catppuccin")
require("vim._core.ui2").enable({
  enable = true
})
vim.pack.add({ "https://github.com/zuqini/zpack.nvim" })
require("zpack").setup({
	{ import = "plugins" },
	{ import = "plugins.mini" },
})
