return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {
          "bash",
          "css",
          "go",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "python",
          "sql",
          "tsx",
          "typescript",
          "vim",
          "vimdoc"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  }
}
