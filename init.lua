require("config")
vim.cmd("colorscheme catppuccin")
require("custom.statusline").setup()
require("vim._core.ui2").enable({
	enable = true,
})
vim.pack.add({ "https://github.com/zuqini/zpack.nvim" })
require("zpack").setup({
	{ import = "plugins" },
	{ import = "plugins.mini" },
})
