local M = {}

local mode_map = {
	["n"] = "NORMAL",
	["i"] = "INSERT",
	["v"] = "VISUAL",
	["V"] = "V-LINE",
	[""] = "V-BLOCK",
	["c"] = "COMMAND",
	["R"] = "REPLACE",
	["s"] = "SELECT",
	["t"] = "TERMINAL",
}

local mode_hl = {
	["NORMAL"] = "%#StatusLineNormal#",
	["INSERT"] = "%#StatusLineInsert#",
	["VISUAL"] = "%#StatusLineVisual#",
	["V-LINE"] = "%#StatusLineVisual#",
	["V-BLOCK"] = "%#StatusLineVisual#",
	["COMMAND"] = "%#StatusLineCommand#",
	["REPLACE"] = "%#StatusLineReplace#",
	["TERMINAL"] = "%#StatusLineTerminal#",
}

local git_branch = ""

local function update_git_branch()
	vim.system({ "git", "branch", "--show-current" }, { text = true }, function(obj)
		if obj.code == 0 and obj.stdout ~= "" then
			git_branch = " " .. obj.stdout:gsub("\n", "")
		else
			git_branch = ""
		end
	end)
end

local function get_mode_with_hl()
	local raw = vim.fn.mode()
	local mode = mode_map[raw] or raw
	local hl = mode_hl[mode] or "%#ModeMsg#"
	return hl .. " " .. mode .. " "
end

local function get_filename()
	local name = vim.fn.expand("%:t")
	if name == "" then
		return "%#StatusLineFile# [No Name]"
	end
	local modified = vim.bo.modified and "%#StatusLineModified# ●%#StatusLineFile#" or ""
	return "%#StatusLineFile# " .. name .. modified
end

local function get_git_branch()
	if git_branch == "" then
		return ""
	end
	return "%#StatusLineGit# \u{ea84}" .. git_branch .. " "
end

local function get_lsp_client_name()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if next(clients) == nil then
		return ""
	end
	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end
	return "%#StatusLineLsp# " .. table.concat(names, ", ")
end

local function get_direnv_status()
	local ok, direnv = pcall(require, "direnv")
	if not ok then
		return ""
	end
	local status = direnv.statusline()
	if status == "" then
		return ""
	end
	return "%#StatusLineDirenv#" .. status
end

local function get_clock()
	return "%#StatusLineClock# \u{f017} " .. os.date("%H:%M") .. " "
end

local function get_sep()
	return "%#StatusLineSep# │"
end

function M.render()
	local direnv = get_direnv_status()
	local lsp = get_lsp_client_name()
	local git = get_git_branch()

	-- 右側：有內容才加分隔符
	local right = {}
	if direnv ~= "" then
		table.insert(right, direnv)
	end
	if lsp ~= "" then
		if #right > 0 then
			table.insert(right, get_sep())
		end
		table.insert(right, lsp)
	end
	table.insert(right, get_sep())
	table.insert(right, get_clock())

	-- 左側：git branch 有內容才加分隔符
	local left = {
		get_mode_with_hl(),
		get_filename(),
	}
	if git ~= "" then
		table.insert(left, get_sep())
		table.insert(left, git)
	end

	return table.concat(left) .. "%#StatusLineSep#%=" .. table.concat(right)
end

function M.setup()
	require("custom.highlight").setup()

	update_git_branch()

	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			require("custom.highlight").setup()
		end,
	})

	vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
		callback = function()
			update_git_branch()
		end,
	})

	local timer = vim.uv.new_timer()
	timer:start(
		0,
		60000,
		vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end)
	)

	vim.o.statusline = "%!v:lua.require('custom.statusline').render()"
end

return M
