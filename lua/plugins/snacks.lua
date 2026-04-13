return {
	"folke/snacks.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = {
			enabled = true,
			layout = "ivy",
			sources = {
				explorer = {
					win = {
						list = {
							wo = {
								statusline = " ",
							},
						},
					},
				},
			},
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>//",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<c-\\>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		-- LSP
		{
			"grd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"grD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"grr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gri",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"grt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto [T]ype Definition",
		},
		{
			"grI",
			function()
				Snacks.picker.lsp_incoming_calls()
			end,
			desc = "Calls [I]ncoming",
		},
		{
			"grO",
			function()
				Snacks.picker.lsp_outgoing_calls()
			end,
			desc = "Calls [O]utgoing",
		},
		{
			"grs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP [s]ymbols",
		},
		{
			"grS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace [S]ymbols",
		},
	},
}
