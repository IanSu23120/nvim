local M = {}

function M.setup()
	local ok, catppuccin = pcall(require, "catppuccin.palettes")
	local c = {}
	if ok then
		c = catppuccin.get_palette()
	end

	-- Mode
	vim.api.nvim_set_hl(0, "StatusLineNormal", { fg = c.base or "#1e1e2e", bg = c.green or "#a6e3a1", bold = true })
	vim.api.nvim_set_hl(0, "StatusLineInsert", { fg = c.base or "#1e1e2e", bg = c.blue or "#89b4fa", bold = true })
	vim.api.nvim_set_hl(0, "StatusLineVisual", { fg = c.base or "#1e1e2e", bg = c.mauve or "#cba6f7", bold = true })
	vim.api.nvim_set_hl(0, "StatusLineCommand", { fg = c.base or "#1e1e2e", bg = c.yellow or "#f9e2af", bold = true })
	vim.api.nvim_set_hl(0, "StatusLineReplace", { fg = c.base or "#1e1e2e", bg = c.red or "#f38ba8", bold = true })
	vim.api.nvim_set_hl(0, "StatusLineTerminal", { fg = c.base or "#1e1e2e", bg = c.teal or "#94e2d5", bold = true })

	-- File
	vim.api.nvim_set_hl(0, "StatusLineFile", { fg = c.text or "#cdd6f4", bold = true })
	vim.api.nvim_set_hl(0, "StatusLineModified", { fg = c.red or "#f38ba8" })

	-- Right side
	vim.api.nvim_set_hl(0, "StatusLineLsp", { fg = c.green or "#a6e3a1" })
	vim.api.nvim_set_hl(0, "StatusLineDirenv", { fg = c.peach or "#fab387" })
	vim.api.nvim_set_hl(0, "StatusLineGit", { fg = c.pink or "#f5c2e7" })
	vim.api.nvim_set_hl(0, "StatusLineClock", { fg = c.lavender or "#b4befe" })

	-- Separator
	vim.api.nvim_set_hl(0, "StatusLineSep", { fg = c.surface1 or "#45475a" })
end

return M
