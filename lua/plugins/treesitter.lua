return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.install({ "c", "cpp", "rust", "javascript", "markdown", "markdown_inline", "comment", "html", "latex", "typst", "yaml" })
	end,
}
