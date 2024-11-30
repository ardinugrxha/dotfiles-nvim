-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

require("hbac").setup({
  autoclose = true,
  threshold = 5,
  close_command = function(bufnr)
    vim.api.nvim_buf_delete(bufnr, {})
  end,
  close_buffers_with_windows = false,
})
require("overseer").setup({
  dap = true,
  strategy = "toggleterm",
})
require("overseer").enable_dap()
require("toggleterm").setup({
  direction = "float",
})
require("outline").setup({
  {
    symbols = {
      icons = {
        File = { icon = "󰈔", hl = "Identifier" },
        Module = { icon = "󰆧", hl = "Include" },
        Namespace = { icon = "󰅪", hl = "Include" },
        Package = { icon = "󰏗", hl = "Include" },
        Class = { icon = "𝓒", hl = "Type" },
        Method = { icon = "ƒ", hl = "Function" },
        Property = { icon = "", hl = "Identifier" },
        Field = { icon = "󰆨", hl = "Identifier" },
        Constructor = { icon = "", hl = "Special" },
        Enum = { icon = "ℰ", hl = "Type" },
        Interface = { icon = "󰜰", hl = "Type" },
        Function = { icon = "", hl = "Function" },
        Variable = { icon = "", hl = "Constant" },
        Constant = { icon = "", hl = "Constant" },
        String = { icon = "𝓐", hl = "String" },
        Number = { icon = "#", hl = "Number" },
        Boolean = { icon = "⊨", hl = "Boolean" },
        Array = { icon = "󰅪", hl = "Constant" },
        Object = { icon = "⦿", hl = "Type" },
        Key = { icon = "🔐", hl = "Type" },
        Null = { icon = "NULL", hl = "Type" },
        EnumMember = { icon = "", hl = "Identifier" },
        Struct = { icon = "𝓢", hl = "Structure" },
        Event = { icon = "🗲", hl = "Type" },
        Operator = { icon = "+", hl = "Identifier" },
        TypeParameter = { icon = "𝙏", hl = "Identifier" },
        Component = { icon = "󰅴", hl = "Function" },
        Fragment = { icon = "󰅴", hl = "Constant" },
        TypeAlias = { icon = " ", hl = "Type" },
        Parameter = { icon = " ", hl = "Identifier" },
        StaticMethod = { icon = " ", hl = "Function" },
        Macro = { icon = " ", hl = "Function" },
      },
    },
  },
})
