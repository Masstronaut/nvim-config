-- Basic vim editor config options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.o.swapfile = false -- Disable swap files
vim.wo.relativenumber = true -- Enable relative line numbers
vim.wo.number = true -- Enable line numbers
vim.opt.cursorline = true -- Highlight the current line
vim.o.termguicolors = true -- Enable 24-bit RGB color
vim.o.smartindent = true -- Auto-indent new lines
vim.o.conceallevel = 2 -- Hide concealable text
vim.opt.scrolloff = 6 -- Keep 6 lines above/below cursor
vim.o.splitbelow = true -- Split windows below current window
vim.o.splitright = true -- Split windows right of the current window

-- manually re-write the status line values so that:
-- 1. the current line number is inline with the relative line numbers
-- 2. The lines are suffixed with a pipe that can be colored.
vim.o.statuscolumn = '%s%=%#LineNr4#%{(v:relnum >= 4)?v:relnum." │ ":""}'
	.. '%#LineNr3#%{(v:relnum == 3)?v:relnum." │ ":""}'
	.. '%#LineNr2#%{(v:relnum == 2)?v:relnum." │ ":""}'
	.. '%#LineNr1#%{(v:relnum == 1)?v:relnum." │ ":""}'
	.. '%#LineNrCurr#%{(v:relnum == 0)?v:lnum." ┃ ":""}'
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

vim.keymap.set(
	"n",
	"<leader>w+",
	function()
    local count = vim.v.count
    if count == 0 then count = 2 end
    vim.cmd("resize +" .. (count) .. "<cr>")
  end,
	{ noremap = true, silent = true, desc = "Increase pane height" }
)
vim.keymap.set(
	"n",
	"<leader>w-",
	function()
    local count = vim.v.count
    if count == 0 then count = 2 end
    vim.cmd("resize -" .. (count) .. "<cr>")
  end,
	{ noremap = true, silent = true, desc = "Decrease pane height" }
)
vim.keymap.set(
	"n",
	"<leader>w<",
	function()
    local count = vim.v.count
    if count == 0 then count = 2 end
    vim.cmd("vertical resize +" .. (count) .. "<cr>")
  end,
	{ noremap = true, silent = true, desc = "Decrease pane width" }
)
vim.keymap.set(
	"n",
	"<leader>w>",
	function()
    local count = vim.v.count
    if count == 0 then count = 2 end
    vim.cmd("vertical resize -" .. (count) .. "<cr>")
  end,
	{ noremap = true, silent = true, desc = "Increase pane width" }
)

-- window resize commands

-- Toggle between hybrid & absolute line numbers
-- This first one disables relative line numbers when:
-- In insert mode
-- The window/pane is not focused
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	pattern = "*",
	callback = function()
		vim.opt.relativenumber = false
	end,
})
-- In normal mode, enable relative line numbers for easier navigation
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	callback = function()
		vim.opt.relativenumber = true
	end,
})
