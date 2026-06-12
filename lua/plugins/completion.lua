return {
  "saghen/blink.cmp",
  dependencies = {
    { "nvim-mini/mini.icons" },
    { "rafamadriz/friendly-snippets" },
    { "onsails/lspkind.nvim",        opts = {} }, -- vscode風格 icons
    { "xzbdmw/colorful-menu.nvim",   opts = {} }, -- 提供 補全菜單 顏色 ex: function 紅色 int 藍色
  },
  event = { "InsertEnter", "CmdlineEnter" },
  sem_version = "1.*",
  opts = {
    cmdline = {
      keymap = { preset = "inherit" },
      completion = { menu = { auto_show = true } },
    },
    keymap = {
      preset = "default",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      menu = {
        draw = {
          columns = { { "kind_icon", "label", gap = 1 }, { "kind", "source_name", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
            kind_icon = {
              text = function(ctx)
                if ctx.source_name ~= "Path" then
                  return require("lspkind").symbol_map[ctx.kind] or "" .. ctx.icon_gap
                end

                local is_unknown_type = vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" },
                  ctx.item.data.type)
                local mini_icon, _ = require("mini.icons").get(
                  is_unknown_type and "os" or ctx.item.data.type,
                  is_unknown_type and "" or ctx.label
                )

                return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
              end,

              highlight = function(ctx)
                if ctx.source_name ~= "Path" then return ctx.kind_hl end

                local is_unknown_type = vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" },
                  ctx.item.data.type)
                local mini_icon, mini_hl = require("mini.icons").get(
                  is_unknown_type and "os" or ctx.item.data.type,
                  is_unknown_type and "" or ctx.label
                )
                return mini_icon ~= nil and mini_hl or ctx.kind_hl
              end,
            }
          },
        },
      },
      documentation = { auto_show = false },
    },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
