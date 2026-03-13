return {
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      window = {
        winblend = 100,
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    config = function()
      vim.diagnostic.config({ virtual_text = false })
      require("tiny-inline-diagnostic").setup({
        preset = "ghost",
        options = {
          enable_on_insert = true,
          multilines = {
            enabled = true,
          },
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix"
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
  }


}
