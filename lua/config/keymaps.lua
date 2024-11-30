-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-s>", "<S-$>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-a>", "<S-^>", { noremap = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-v>", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "mciw*<Cmd>nohl<CR>", { remap = true })

vim.api.nvim_create_user_command("OilToggle", function()
  vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil --float")
end, { nargs = 0 })
vim.api.nvim_set_keymap("n", "<leader>e", ":OilToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    local filetype = vim.bo.filetype
    local dapui = require("dapui")

    if
      vim.tbl_contains(
        { "typescript", "ts", "c", "cpp", "py", "python", "go", "elx", "php", "javascript", "js" },
        filetype
      )
    then
      dapui.open()
    end
  end,
})

local function focus_or_attach_dap(buffer_name, dap_ui_element)
  local found = false

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name:match(buffer_name) then
      vim.api.nvim_set_current_win(win) -- Focus the window
      found = true
      break
    end
  end

  if not found then
    require("dapui").open({ dap_ui_element })
  end
end

vim.keymap.set("n", "<leader>ds", function()
  focus_or_attach_dap("DAP Scopes", "scopes")
end, { desc = "Focus or open DAP Scopes" })

vim.keymap.set("n", "<leader>dr", function()
  focus_or_attach_dap("dap%-repl%-", "repl") -- Focus or attach to DAP Repl
end, { desc = "Focus or Open DAP Repl" })

vim.keymap.set("n", "<leader>dt", function()
  local terms = require("toggleterm.terminal")
  local toggle = require("toggleterm").toggle

  -- Check if any terminal buffer is already open
  local term_open = false
  for _, term in pairs(terms.get_all()) do
    if term:is_open() then
      term_open = true
      term:toggle()
      return
    end
  end

  -- If no terminal is open, toggle the default terminal
  if not term_open then
    toggle(1) -- Opens the default terminal (ID 1)
  end
end, { desc = "Toggle Terminal" })

vim.keymap.set("n", "<leader>dx", function()
  local dap = require("dap")
  if dap.session() then
    dap.terminate()
    print("DAP session terminated.")
  else
    print("No active DAP session.")
  end
end, { desc = "Terminate DAP Session" })

vim.api.nvim_set_keymap("t", "<ESC>", [[<C-\><C-n>]], { noremap = true, silent = true })

vim.keymap.set("n", "<leader>dq", function()
  require("dap").clear_breakpoints()
  print("All breakpoints cleared.")
end, { desc = "Clear all DAP breakpoints" })
