return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", 
  config = function()
    -- Setup treesitter for indentation, highlighting, etc. for the languages I use
    local tsconfig = require("nvim-treesitter.configs")
    tsconfig.setup({
      auto_install = true,
      highlight = {enabled = true},
      indent = { enabled = true },
    })
  end
}
