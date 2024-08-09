return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3     -- show a single status line at the bottom
    vim.opt.splitkeep = "screen" -- prevents jumping when open/close sidebars
  end,
  keys = {
    { -- toggle the right sidebar tree nav
      "<Leader>pl",
      function()
        require("lazy").load({ plugins = { "neo-tree.nvim" } })
        require("edgy").toggle("right")

        -- focus the file tree pane after opening
        vim.schedule(function()
          local all_win_ids = vim.api.nvim_list_wins()
          local edgy = require("edgy")
          -- Iterate over each window ID
          for _, win_id in ipairs(all_win_ids) do
            -- Get the Edgy.Window object for the current window ID
            local win = edgy.get_win(win_id)

            -- If the window exists in edgy and is the "Files" window, focus it
            if win and win.view.get_title() == "Files" then
              vim.api.nvim_set_current_win(win_id)
            end
          end
        end)
      end,
      desc = "Panes: Right (toggle)",
    },
    { -- focus the file tree pane
      "<leader>pf",
      function()
        require("lazy").load({ plugins = { "neo-tree.nvim" } })
        require("edgy").open("right")
        vim.cmd("Neotree reveal filesystem")
      end,
      desc = "Panes: Filesystem (focus)",
    },
    {
      "<leader>pb",
      function()
        require("lazy").load({ plugins = { "neo-tree.nvim" } })
        require("edgy").open("right")
        vim.cmd("Neotree reveal buffers")
      end,
      desc = "Panes: Buffers (focus)",
    },
    {
      "<leader>pg",
      function()
        require("lazy").load({ plugins = { "neo-tree.nvim" } })
        require("edgy").open("right")
        vim.cmd("Neotree reveal git_status")
      end,
      desc = "Panes: Git (focus)",
    },
  },
  opts = {
    -- right sidebar tree nav (files, buffers, git, etc.)
    right = {
      -- Neo-tree filesystem always takes half the screen height
      {
        title = "Files",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        open = "Neotree filesystem",
        size = { height = 0.5 },
        pinned = true,
      },
      {
        title = "Buffers",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "buffers"
        end,
        pinned = true,
        collapsed = false, -- show window as closed/collapsed on start
        open = "Neotree position=top buffers",
        size = { height = 0.25 },
      },
      {
        title = "Git",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        pinned = true,
        collapsed = false, -- show window as closed/collapsed on start
        open = "Neotree position=left git_status",
        size = { height = 0.25 },
      },
      -- any other neo-tree windows
      "neo-tree",
    },
  },
}
