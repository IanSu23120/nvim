vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = function(mode, keys, command, desc)
  local opts = { noremap = true, silent = true }
  if desc then
    opts.desc = desc
  end
  vim.keymap.set(mode, keys, command, opts)
end

map("v", "<", "<gv")
map("v", ">", ">gv")

vim.opt.whichwrap:append("<>[]hl") -- 允許左右鍵跨行
map("n", "j", "jzz")
map("n", "k", "kzz")
map("", "j", "gj") -- 用 gj/gk 替代 j/k（處理折行）
map("", "k", "gk")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])

map("n", "<leader>vw", ":vsplit<CR>", "[v]split [w]indow")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "Q", "<nop>")

map({ "n", "v", "x" }, "<leader>y", '"+y<CR>') -- 複製到系統剪貼簿
map({ "n", "v", "x" }, "<leader>p", '"+p<CR>')

-- 關閉命令歷史視窗
map("n", "q/", "<nop>")
-- vim.keymap.set("n", ":", function()
-- 	local keys = vim.api.nvim_replace_termcodes("q:", true, false, true)
-- 	vim.api.nvim_feedkeys(keys, "n", false)
-- end, { noremap = true, silent = true })
-- vim.api.nvim_create_autocmd("CmdwinEnter", {
-- 	callback = function()
-- 		vim.keymap.set("n", "q", "<cmd>quit<CR>", { buffer = true, noremap = true, silent = true, nowait = true })
-- 	end,
-- })

-- 切換buffer
map("n", "<M-n>", "<cmd>bnext<CR>")
map("n", "<M-p>", "<cmd>bprevious<CR>")
