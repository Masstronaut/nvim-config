return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    -- Toggle the neo-tree pane with <C-n>
    {
      "<C-n>",
      ":Neotree toggle<CR>",
      { noremap = true, silent = true },
      desc = "Toggle the Neotree pane",
    },
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = "right",
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignore = false,
        hide_by_name = {
          ".git",
        },
      },
    },
  },
}
