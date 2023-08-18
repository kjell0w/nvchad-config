---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find project" },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = {
      function()
        local term = require("nvterm.terminal").new "float"
        vim.api.nvim_chan_send(term.job_id, "lazygit\n")
      end,
      "open Lazygit",
    },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },

    -- ["l"] = { "<cmd> NvimTreeOpen <CR>", "open tree" },
  },
}

M.twilight = {
  n = {
    ["<leader>tw"] = { "<cmd>Twilight<cr>", "toggle twilight" },
  },
}

-- more keybinds!

return M
