return {
  -- add gruvbox
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      colors = {
        sky = "#0298db", -- redefine an existing color
        cloud = "#59e0f8",
        greener = "#26c98e",
      },
      highlights = {
        ["@keyword"] = { fg = "$sky" },
        ["@keyword.conditional"] = { fg = "$sky" },
        ["@keyword.directive"] = { fg = "$sky" },
        ["@keyword.exception"] = { fg = "$sky" },
        ["@keyword.import"] = { fg = "$sky" },
        ["@keyword.operator"] = { fg = "$sky" },
        ["@keyword.repeat"] = { fg = "$sky" },
        ["@variable.builtin"] = { fg = "$sky" },
        ["@boolean"] = { fg = "$yellow" },
        ["@number"] = { fg = "$yellow" },
        ["@number.float"] = { fg = "$yellow" },
        ["@type.builtin"] = { fg = "$sky" },
      },
    },
  },

  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      -- your optional config goes here, see below.
      transparent = true
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
