return {
  -- add gruvbox
  {
    "ardinugrxha/night-horizon.nvim",
    opts = {
      style = "midnight",
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
      colorscheme = "night-horizon",
    },
  },
}
