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
    }
  },
  {
    "nvim-mini/mini.extra",
    lazy = true,
    dependenceis = { "nvim-mini/mini.pick" }
  }
}
