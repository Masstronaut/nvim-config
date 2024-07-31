-- Basic vim editor config options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cursorline = true

-- Toggle between hybrid & absolute line numbers
-- This first one disables relative line numbers when:
-- In insert mode
-- The window/pane is not focused
vim.api.nvim_create_autocmd({"InsertEnter", "WinLeave"}, {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = false
    end
})
-- In normal mode, enable relative line numbers for easier navigation
vim.api.nvim_create_autocmd({"InsertLeave", "WinEnter"}, {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = true
    end
})
