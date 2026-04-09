require("config")
vim.pack.add({ 'https://github.com/zuqini/zpack.nvim' })
require("zpack").setup({
    {import = "plugins" },
    {import = "plugins.mini"}
})
