vim.g.mapleader = " "

-- Tab open/close keybinds
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { noremap = true, silent = true, desc = "Close tab" })

-- Pane management keybinds that are a little easier to use.
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<CR>", { noremap = true, silent = true, desc = "Focus left pane" })
vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<CR>", { noremap = true, silent = true, desc = "Focus lower pane" })
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<CR>", { noremap = true, silent = true, desc = "Focus upper pane" })
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<CR>", { noremap = true, silent = true, desc = "Focus right pane" })
vim.keymap.set("n", "<leader>wH", "<cmd>wincmd H<CR>", { noremap = true, silent = true, desc = "Move pane left" })
vim.keymap.set("n", "<leader>wJ", "<cmd>wincmd J<CR>", { noremap = true, silent = true, desc = "Move pane down" })
vim.keymap.set("n", "<leader>wK", "<cmd>wincmd K<CR>", { noremap = true, silent = true, desc = "Move pane up" })
vim.keymap.set("n", "<leader>wL", "<cmd>wincmd L<CR>", { noremap = true, silent = true, desc = "Move pane right" })

-- gets the current [count] for a motion. If the count is 0 (not set) it will default to the minimum provided value.
--@param min number
local min_count = function(min)
  local count = vim.v.count
  if count == 0 then
    count = min
  end
  return count
end

-- Set up pane resizing keybinds
vim.keymap.set("n", "<leader>w+", function()
  local count = min_count(2)
  vim.cmd("resize +" .. count .. "<cr>")
end, { noremap = true, silent = true, desc = "Increase pane height" })
vim.keymap.set("n", "<leader>w-", function()
  local count = min_count(2)
  vim.cmd("resize -" .. count .. "<cr>")
end, { noremap = true, silent = true, desc = "Decrease pane height" })
vim.keymap.set("n", "<leader>w<", function()
  local count = min_count(2)
  vim.cmd("vertical resize +" .. count .. "<cr>")
end, { noremap = true, silent = true, desc = "Decrease pane width" })
vim.keymap.set("n", "<leader>w>", function()
  local count = min_count(2)
  vim.cmd("vertical resize -" .. count .. "<cr>")
end, { noremap = true, silent = true, desc = "Increase pane width" })

-- move lines up and down in insert and normal mode
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("i", "<A-j>", "<cmd>m .+1<CR>", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<cmd>m .-2<CR>", { noremap = true, silent = true, desc = "Move line up" })
