return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    cmd = "Neotree",
    keys = {
      { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    },

    opts = {
      window = { position = "right" },
      filesystem = {
        follow_current_file = { enabled = false },
        hijack_netrw_behavior = "open_current",
      },
      open_files_do_not_replace_types = {},
    },
    lazy = false, -- neo-tree will lazily load itself
  }
}

