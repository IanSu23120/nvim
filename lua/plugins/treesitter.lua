return {
  "romus204/tree-sitter-manager.nvim",
  config = function()
    require("tree-sitter-manager").setup({
      ensure_installed = {
        "markdown",
        "lua",
        "c",
        "cpp",
        "typescript",
        "rust"
      },
      auto_install = true,
    })
  end
}
