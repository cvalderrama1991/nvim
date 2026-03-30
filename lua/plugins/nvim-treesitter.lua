return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    -- main = "nvim-treesitter.config",
    cmd = {"TSUpdateSync", "TSUpdate", "TSInstall"},
    -- dependencies = {"nvim-treesitter/nvim-treesitter-objects"},
    opts = {
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
        "rust",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc"
      },
      highlight = { enable = true },
      indent = { enable = true },
    }
}
