vim.lsp.config("vtsls", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),

  settings = {
    typescript = {
      suggest = {
        autoImports = true,
      },
      preferences = {
        includePackageJsonAutoImports = "on",
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        importModuleSpecifierPreference = "non-relative",
      },
    },

    javascript = {
      suggest = {
        autoImports = true,
      },
    },
  },
})
-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("clangd")
-- vim.lsp.enable("nixd")
-- vim.lsp.enable("ty")
vim.lsp.enable("vtsls")
-- vim.lsp.enable("vscode")
-- vim.lsp.enable("jdtls")
