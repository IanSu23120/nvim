return {
  "nvim-mini/mini.clue",
  lazy = false,
  opts = {
    window = {
      delay = 20,
    },
    triggers = {
      -- Leader triggers
      { mode = { "n", 'x' }, keys = '<Leader>' },

      -- `[` and `]` keys
      { mode = "n",          keys = '[' },
      { mode = "n",          keys = ']' },

      -- Built-in completion
      { mode = "i",          keys = '<C-x>' },

      -- `g` key
      { mode = { "n", 'x' }, keys = 'g' },

      -- Marks
      { mode = { "n", 'x' }, keys = "'" },
      { mode = { "n", 'x' }, keys = '`' },

      -- Registers
      { mode = { "n", 'x' }, keys = '"' },
      { mode = { "i", 'c' }, keys = '<C-r>' },

      -- Window commands
      { mode = "n",          keys = '<C-w>' },

      -- `z` key
      { mode = { "n", 'x' }, keys = 'z' },
    }
  },
}
