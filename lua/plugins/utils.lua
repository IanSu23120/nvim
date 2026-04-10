return {
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
}
