return {
	"nvim-mini/mini.jump2d",
	keys = {
		{
			"<M-m>",
			function()
				require("mini.jump2d").start()
			end,
		},
	},
	opts = {
		mappings = {
			start_jumping = false,
		},
	},
}
