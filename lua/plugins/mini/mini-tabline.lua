return {
  "nvim-mini/mini.tabline",
  event = "BufReadPre",
  config = function() require("mini.tabline").setup() end,
}

