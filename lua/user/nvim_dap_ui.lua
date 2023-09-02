local dap, dapui, hydra = require "dap", require "dapui"

-- Setup Virtual Text
require("nvim-dap-virtual-text").setup {}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/user/dap.lua", true)) do
  loadfile(ft_path)()
end

-- UI structure
dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 80,
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
}

-- Events Listeners
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open {}
end
