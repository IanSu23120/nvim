return {
  "nvim-mini/mini.files",
  dependencies = { "nvim-mini/mini.icons" },
  keys = {
    {
      "-",
      function()
        require("mini.files").open()
      end
    }
  }
}
