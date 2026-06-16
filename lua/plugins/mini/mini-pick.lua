return {
  {
    "nvim-mini/mini.pick",
    dependencies = { "nvim-mini/mini.icons" },
    keys = {
      {
        "<leader>ff",
        function()
          require("mini.pick").builtin.files()
        end,
        desc = "[f]ind [f]ile"
      },
      {
        "<leader>//",
        function()
          require("mini.pick").builtin.grep_live()
        end,
        desc = "grep live"
      },
      {
        "<leader>/?",
        function()
          require("mini.pick").builtin.grep()
        end,
        desc = "grep"
      },
      -- mark --
      {
        "<leader>ma",
        function()
          require("mini.extra").pickers.marks({ scope = "all" })
        end,
        desc = "[m]arks all"
      },
      {
        "<leader>mg",
        function()
          require("mini.extra").pickers.marks({ scope = "global" })
        end,
        desc = "[m]arks global"
      },
      {
        "<leader>mb",
        function()
          require("mini.extra").pickers.marks({ scope = "buf" })
        end,
        desc = "[m]arks buffer"
      },
      -- lsp --
      {
        "gd",
        function()
          require("mini.extra").pickers.lsp({ scope = "definition" })
        end,
        desc = "definition"
      },
      {
        "gD",
        function()
          require("mini.extra").pickers.lsp({ scope = "declaration" })
        end,
        desc = "declarartion"
      },
      {
        "gr",
        function()
          require("mini.extra").pickers.lsp({ scope = "references" })
        end,
        desc = "references"
      },
      {
        "gi",
        function()
          require("mini.extra").pickers.lsp({ scope = "implementation" })
        end,
        desc = "implementation"
      },
      {
        "gt",
        function()
          require("mini.extra").pickers.lsp({ scope = "type_definition" })
        end,
        desc = "type_definition"
      },
      {
        "gs",
        function()
          require("mini.extra").pickers.lsp({ scope = "workspace_symbol" })
        end,
        desc = "workspace_symbol"
      },
      {
        "gS",
        function()
          require("mini.extra").pickers.lsp({ scope = "workspace_symbol_live" })
        end,
        desc = "workspace_symbol_live"
      },
      {
        "<leader>ch",
        function()
          require("mini.extra").pickers.history()
        end,
        desc = "[c]ommand [h]istory"
      }
    },
    opts = {},
  },
  {
    "nvim-mini/mini.extra",
    lazy = true,
    dependenceis = { "nvim-mini/mini.pick" },
    opts = {}
  }
}
