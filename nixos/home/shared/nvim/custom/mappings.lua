---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR> ", "toggle NvimTree" },
  },
}

-- more keybinds!

return M
