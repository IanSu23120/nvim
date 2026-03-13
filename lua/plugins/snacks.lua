return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>e",       function() Snacks.explorer() end,                     desc = "File Explorer", },
    { "<C-\\>",          function() Snacks.terminal() end,                     desc = "Toggle Terminal", },
    { "<leader><space>", function() Snacks.picker.smart() end,                 desc = "Smart Find Files", },
    { "<leader>f",       function() Snacks.picker.files() end,                 desc = "Find files", },
    { "<leader>,",       function() Snacks.picker.buffers() end,               desc = "Find buffers", },
    { "<leader>:",       function() Snacks.picker.command_history() end,       desc = "Command History", },
    { "<leader>n",       function() Snacks.picker.notifications() end,         desc = "Notification History", },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition", },
    { "gD",              function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration", },
    { "gr",              function() Snacks.picker.lsp_references() end,        nowait = true,                     desc = "References", },
    { "gI",              function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation", },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition", },
    { "gai",             function() Snacks.picker.lsp_incoming_calls() end,    desc = "C[a]lls Incoming", },
    { "gao",             function() Snacks.picker.lsp_outgoing_calls() end,    desc = "C[a]lls Outgoing", },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols", },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },
    -- Grep
    { "<leader>/b",      function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
    { "<leader>/B",      function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
    { "<leader>/g",      function() Snacks.picker.grep() end,                  desc = "Grep" },
    { "<leader>/w",      function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
  },
  opts = {
    bigfile = { enabled = true },
    explorer = {
      enabled = true,
    },
    picker = {
      enabled = true,
      layout = "ivy",
      sources = {
        explorer = {
          layout = "right",
        },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    scroll = { enabled = true },
    terminal = { enabled = true },
    lazygit = { enabled = true },
  },
}
