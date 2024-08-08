return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end
      -- Set up the hover window to have a border
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Code: go to Definition" })
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Code: go to Reference" })
      vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
      vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "reName symbol (rename)" })
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format file" })
      -- automatically format files on write
      -- Create an autocommand group to hold the command for formatting
      local format_group = vim.api.nvim_create_augroup("AutoFormat", { clear = true })
      -- Create the autocommand that runs the LSP formatting when a buffer is written to disk
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = format_group,
        pattern = "*",                     -- match all files
        callback = function()
          vim.lsp.buf.format({ async = false }) -- format the file synchronously before write
        end,
      })
    end,
  },
}
