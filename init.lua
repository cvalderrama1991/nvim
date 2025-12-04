vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)
-- Theme 
vim.cmd.colorscheme("retrobox")

-- Background color
local bg = "#1a1a1a"  -- dark gray (adjust if you prefer lighter/darker)

-- Core editor areas
vim.api.nvim_set_hl(0, "Normal",       { bg = bg })
vim.api.nvim_set_hl(0, "NormalNC",     { bg = bg })  -- non-current window
vim.api.nvim_set_hl(0, "SignColumn",   { bg = bg })
vim.api.nvim_set_hl(0, "LineNr",       { bg = bg })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = bg })

-- Floating windows
vim.api.nvim_set_hl(0, "NormalFloat",  { bg = bg })
vim.api.nvim_set_hl(0, "FloatBorder",  { bg = bg })

-- Completion menu (cmp, etc.)
vim.api.nvim_set_hl(0, "Pmenu",        { bg = bg })
vim.api.nvim_set_hl(0, "PmenuSel",     { bg = "#2a2a2a" }) -- slightly lighter selection
vim.api.nvim_set_hl(0, "PmenuSbar",    { bg = bg })
vim.api.nvim_set_hl(0, "PmenuThumb",   { bg = "#333333" })

-- End-of-buffer tildes
vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = bg })

-- Statusline / Tabline / Winbar (many themes override these)
vim.api.nvim_set_hl(0, "StatusLine",   { bg = bg })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = bg })
vim.api.nvim_set_hl(0, "TabLine",      { bg = bg })
vim.api.nvim_set_hl(0, "TabLineFill",  { bg = bg })
vim.api.nvim_set_hl(0, "TabLineSel",   { bg = "#2a2a2a" })

-- Misc UI elements
vim.api.nvim_set_hl(0, "VertSplit",    { bg = bg, fg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = bg, fg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "FoldColumn",   { bg = bg })
vim.api.nvim_set_hl(0, "Folded",       { bg = bg })

-- Search / highlights (optional but helps consistency)
-- vim.api.nvim_set_hl(0, "Visual",       { bg = "#333333" })
-- vim.api.nvim_set_hl(0, "Search",       { bg = "#444444" })
-- vim.api.nvim_set_hl(0, "IncSearch",    { bg = "#555555" })

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

-- Load plugins
require("lazy").setup("plugins.init")

-- Load options
require("core.options")

-- Load keymaps
require("core.keymaps")

-- Load autocmds
require("core.autocmds")

-- Load friendly snippets (this could also be moved to a snippets.lua if desired)
require("luasnip.loaders.from_vscode").lazy_load()

-- -- Command-line completion
-- vim.opt.wildmenu = true
-- vim.opt.wildmode = "longest:full,full"
-- vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

