-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Globals and Theme
require("globals")

-- Load plugins
require("lazy").setup("plugins.init")

-- Load options
require("options")

-- Load keymaps
require("keymaps")

-- Load autocmds
require("autocmds")

-- Load friendly snippets (this could also be moved to a snippets.lua if desired)
require("luasnip.loaders.from_vscode").lazy_load()

-- -- Command-line completion
-- vim.opt.wildmenu = true
-- vim.opt.wildmode = "longest:full,full"
-- vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

