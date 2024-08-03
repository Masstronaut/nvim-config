return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Setup treesitter for indentation, highlighting, etc. for the languages I use
    local tsconfig = require("nvim-treesitter.configs")
    tsconfig.setup({
      ensure_installed = {
        "regex",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
