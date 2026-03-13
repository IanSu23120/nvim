return {
  "nvim-mini/mini.trailspace",
  event = "QuitPre",
  config = function()
    require("mini.trailspace").setup()
  end,
}

