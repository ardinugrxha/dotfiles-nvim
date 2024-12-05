return {
  -- add gruvbox
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      colors = {},
      highlights = {},
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
