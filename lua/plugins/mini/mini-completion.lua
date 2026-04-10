return {
	{
		"nvim-mini/mini.completion",
		dependencies = { "nvim-mini/mini.snippets", opts = {} },
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {},
	},
}
