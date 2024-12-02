return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local opts = {
      options = {
        icons_enabled = true,
        theme = "ayu_mirage",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          LazyVim.lualine.pretty_path(),
          "diagnostics",
        },
        lualine_x = {
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = function()
              return LazyVim.ui.fg("Debug")
            end,
          },
          {
            function()
              local msg = "No Active Lsp"
              local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            icon = " LSP:",
            color = { fg = "#59c2ff", gui = "bold" },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {
          "location",
        },
        lualine_y = {},
        lualine_z = {},
      },

      extensions = { "neo-tree", "lazy" },
    }
    return opts
  end,
}
