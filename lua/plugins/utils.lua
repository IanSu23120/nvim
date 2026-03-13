return {
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		config = function()
			vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open oil directory" })
			require("oil").setup({
				columns = {
					"icon",
					"size",
					"mtime",
				},
				skip_confirm_for_simple_edits = true,
			})
		end,
	},
	{
		"NotAShelf/direnv.nvim",
		config = function()
			require("direnv").setup({
				autoload_direnv = true,
				statusline = {
					enabled = true,
				},
				notifications = {
					silent_autoload = false,
				},
			})
		end,
	},
	{ "nemanjamalesija/smart-paste.nvim", event = "VeryLazy", config = true },
}
