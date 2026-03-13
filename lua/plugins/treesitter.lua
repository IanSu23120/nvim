return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
    local uv = vim.uv or vim.loop
    local isNixOS = uv.fs_stat("/etc/NIXOS") ~= nil
		local ts = require("nvim-treesitter")
    if isNixOS then
      ts.install({})
    else
      ts.install({ "c", "cpp", "rust", "javascript", "markdown", "markdown_inline", "comment", "html", "latex", "typst", "yaml" })
    end
	end,
}
