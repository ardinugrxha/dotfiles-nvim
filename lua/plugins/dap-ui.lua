return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
  },
  -- stylua: ignore
  keys = {
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
  opts = {
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.5 }, -- 50% of the total height
          { id = "breakpoints", size = 0.2 }, -- 20% of the total height
          { id = "stacks", size = 0.15 }, -- 15% of the total height
          { id = "watches", size = 0.15 }, -- 15% of the total height
        },
        size = 55,
        position = "left",
      },
      {
        elements = {
          "console", -- 20% of the total height
        },
        size = 55,
        position = "right",
      },
    },
  },
  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup(opts)
    dap.listeners.before.attach.dapui_config = function()
      dapui.open({})
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open({})
    end
  end,
}
