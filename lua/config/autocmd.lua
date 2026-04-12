vim.api.nvim_create_autocmd("User", {
	pattern = "DirenvLoaded",
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local ft = vim.bo[buf].filetype
		if ft ~= "" then
			-- 重新觸發 LSP 啟動
			vim.bo[buf].filetype = ft
		end
	end,
})
-- -- 0.12 treesitter api
-- vim.api.nvim_create_autocmd("FileType", {
-- 	callback = function()
-- 		-- Enable treesitter highlighting and disable regex syntax
-- 		pcall(vim.treesitter.start)
-- 		-- Enable treesitter-based indentation
-- 		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 	end,
-- })

-- snacks explorer
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local snacks_windows = {}
		local floating_windows = {}
		local windows = vim.api.nvim_list_wins()
		for _, w in ipairs(windows) do
			local filetype = vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(w) })
			if filetype:match("snacks_") ~= nil then
				table.insert(snacks_windows, w)
			elseif vim.api.nvim_win_get_config(w).relative ~= "" then
				table.insert(floating_windows, w)
			end
		end
		if 1 == #windows - #floating_windows - #snacks_windows then
			-- Should quit, so we close all Snacks windows.
			for _, w in ipairs(snacks_windows) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})
