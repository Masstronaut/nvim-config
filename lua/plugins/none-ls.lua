local function eslint_config_exists()
  local config_file_names = { ".eslintrc.js", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc" }
  for _, config_file_name in ipairs(config_file_names) do
    if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. config_file_name) == 1 then
      return true
    end
  end
  return false
end

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        eslint_config_exists() and null_ls.builtins.diagnostics.eslint_d or nil,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    })
  end,
}
