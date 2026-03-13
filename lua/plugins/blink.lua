return {
	{
		"onsails/lspkind.nvim",
		lazy = true,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		lazy = true,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
		},
		event = { "InsertEnter", "CmdlineEnter" },
		version = "1.*",
		opts = {
			cmdline = {
				enabled = true,
				keymap = {
					preset = "inherit",
					["<Tab>"] = { "accept", "fallback" },
				},
				completion = { menu = { auto_show = true } },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					lua = { inherit_defaults = true, "lazydev" },
				},
				providers = {
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
				},
			},
			completion = {
				menu = {
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									if ctx.source_name ~= "Path" then
										return require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
											.. ctx.icon_gap
									end

									local is_unknown_type = vim.tbl_contains(
										{ "link", "socket", "fifo", "char", "block", "unknown" },
										ctx.item.data.type
									)
									local mini_icon, _ = require("mini.icons").get(
										is_unknown_type and "os" or ctx.item.data.type,
										is_unknown_type and "" or ctx.label
									)

									return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
								end,

								highlight = function(ctx)
									if ctx.source_name ~= "Path" then
										return ctx.kind_hl
									end

									local is_unknown_type = vim.tbl_contains(
										{ "link", "socket", "fifo", "char", "block", "unknown" },
										ctx.item.data.type
									)
									local mini_icon, mini_hl = require("mini.icons").get(
										is_unknown_type and "os" or ctx.item.data.type,
										is_unknown_type and "" or ctx.label
									)
									return mini_icon ~= nil and mini_hl or ctx.kind_hl
								end,
							},
						},
					},
				},
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
}
