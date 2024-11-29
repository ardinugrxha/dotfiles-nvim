return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ue",
        function()
          require("edgy").toggle()
        end,
        desc = "Edgy Toggle",
      },
      {
        "<leader>uE",
        function()
          require("edgy").select()
        end,
        desc = "Edgy Select Window",
      },
    },
    opts = function()
      local opts = {
        bottom = {
          {
            ft = "noice",
            size = { height = 0.13 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "help",
            size = { height = 13, width = 100 },
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          { title = "DAP Repl", ft = "dap-repl", size = { height = 13 } },
          {
            ft = "toggleterm",
            size = { height = 13 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            title = "Trouble",
            ft = "trouble",
            size = { height = 13 },
            pinned = true,
            filter = function(buf)
              return vim.bo[buf].filetype == "trouble"
            end,
          },
          { ft = "qf", title = "QuickFix" },
          { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
        },
        left = {
          { title = "DAP Scopes", ft = "dapui_scopes", size = { height = 0.4, width = 50 } },
          { title = "DAP Breakpoints", ft = "dapui_breakpoints", size = { height = 0.2, width = 50 } },
          { title = "DAP Stacks", ft = "dapui_stacks", size = { height = 0.2, width = 50 } },
          { title = "DAP Watches", ft = "dapui_watches", size = { height = 0.2, width = 50 } },
          { title = "Neotest Summary", ft = "neotest-summary" },
        },
        right = {
          -- { title = "DAP Console", ft = "dapui_console", size = { height = 0.9, width = 53 }, pinned = false },
        },
        keys = {
          -- Resize bindings
          ["<c-Right>"] = function(win)
            win:resize("width", 2)
          end,
          ["<c-Left>"] = function(win)
            win:resize("width", -2)
          end,
          ["<c-Up>"] = function(win)
            win:resize("height", 2)
          end,
          ["<c-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
      }

      -- Add DAP-specific trouble integration
      for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = "trouble",
          filter = function(_buf, win)
            return vim.w[win].trouble
              and vim.w[win].trouble.position == pos
              and vim.w[win].trouble.type == "split"
              and vim.w[win].trouble.relative == "editor"
              and not vim.w[win].trouble_preview
          end,
        })
      end

      return opts
    end,
  },
}
