return {
  "nvim-mini/mini.statusline",
  event = "VeryLazy",
  config = function()
    -- 將mini groups 設置背景色
    local colors = {
      bg = "#213555",
      fg = "#abb2bf",
    }

    -- 強制所有組使用統一的背景色
    local groups = {
      "MiniStatuslineModeNormal",
      "MiniStatuslineModeInsert",
      "MiniStatuslineModeVisual",
      "MiniStatuslineModeReplace",
      "MiniStatuslineModeCommand",
      "MiniStatuslineModeOther",
      "MiniStatuslineDevinfo",
      "MiniStatuslineFilename",
      "MiniStatuslineFileinfo",
      "MiniStatuslineInactive",

      "MiniTablineCurrent",
    }

    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { fg = colors.fg, bg = colors.bg })
    end

    local function get_lsp_names()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then return "" end

      local names = {}
      for _, client in ipairs(clients) do
        table.insert(names, client.name)
      end
      return table.concat(names, ", ")
    end
    require("mini.statusline").setup({
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local git = MiniStatusline.section_git({ trunc_width = 40 })
          local diff = MiniStatusline.section_diff({ trunc_width = 75 })
          local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location = MiniStatusline.section_location({ trunc_width = 75 })
          local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

          return MiniStatusline.combine_groups({
            { hl = mode_hl, strings = { mode } },
            { hl = mode_hl, strings = { search, location } },
            "%<", -- 斷點
            "%=", -- 結束靠左對齊(接下來都靠右)
            { hl = "MiniStatuslineDevinfo", strings = { get_lsp_names() } },
            { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
            -- { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
          })
        end,
      },
    })
  end,
}

