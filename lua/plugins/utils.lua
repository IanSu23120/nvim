return {
	{
		"folke/which-key.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"Loukis-13/paint.nvim",
		opts = {},
	},
	{
		"NotAShelf/direnv.nvim",
		opts = {
			autoload_direnv = true,
			keybindings = {
				allow = false,
				deny = false,
				reload = false,
				edit = false,
			},
			statusline = {
				enabled = true,
			},
			notifications = {
				-- 開啟通知
				silent_autoload = false,
			},
		},
	},
	{
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
	},
}
