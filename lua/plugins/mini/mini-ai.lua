return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup()
  end,
}
