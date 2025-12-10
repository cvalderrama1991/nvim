-- Basic settings
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers (hybrid mode with number)
vim.opt.cursorline = true     -- Highlight the line where the cursor is
vim.opt.wrap = false          -- Disable line wrapping
vim.opt.scrolloff = 10        -- Minimum lines to keep above/below cursor when scrolling
vim.opt.sidescrolloff = 8     -- Minimum columns to keep left/right of cursor when horizontal scrolling

-- Indentation
vim.opt.tabstop = 2        -- Width of a \t character
vim.opt.shiftwidth = 2     -- Spaces used for each indentation step (>> / <<)
vim.opt.softtabstop = 2    -- Number of spaces a <Tab> counts for while editing
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart auto-indenting on new lines
vim.opt.autoindent = true  -- Copy indent from current line when starting a new one

-- Search settings
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Override ignorecase if search contains uppercase letters
vim.opt.hlsearch = false  -- Do not highlight all matches after search (use :nohl to clear)
vim.opt.incsearch = true  -- Show search matches incrementally as you type

-- Visual settings
vim.opt.termguicolors = true                      -- Enable 24-bit RGB colors in the terminal
vim.opt.signcolumn = "yes"                        -- Always show the sign column (for git signs, diagnostics, etc.)
vim.opt.colorcolumn = "100"                       -- Highlight column 100 (common code width limit)
vim.opt.showmatch = true                          -- Briefly jump to matching bracket when inserted
vim.opt.matchtime = 2                             -- Tenths of a second to show the matching bracket (0.2s)
vim.opt.cmdheight = 1                             -- Height of the command-line (1 line)
vim.opt.completeopt = "menuone,noinsert,noselect" -- Better completion menu behavior
vim.opt.showmode = true                           -- Show current mode (INSERT, VISUAL, etc.) in command line
vim.opt.pumheight = 10                            -- Maximum height of the popup menu (completion)
vim.opt.pumblend = 10                             -- Transparency for popup menu (0-100)
vim.opt.winblend = 0                              -- Transparency for floating windows (0 = opaque)
vim.opt.conceallevel = 0                          -- Don't hide/conceal text (e.g., markdown syntax)
vim.opt.concealcursor = ""                        -- Don't conceal text in any cursor line mode
vim.opt.lazyredraw = true                         -- Don't redraw screen during macros for speed
vim.opt.synmaxcol = 300                           -- Stop syntax highlighting after column 300 (performance)

-- File handling
vim.opt.backup = false      -- Don't create backup files (~file)
vim.opt.writebackup = false -- Don't make a backup before overwriting a file
vim.opt.swapfile = false    -- Don't create .swp files
vim.opt.undofile = true     -- Persistent undo (undo even after closing file)
vim.opt.updatetime = 300    -- Faster completion & CursorHold events (ms)
vim.opt.timeoutlen = 500    -- Time to wait for a mapped sequence to complete (ms)
vim.opt.ttimeoutlen = 0     -- Disable timeout for key codes (immediate escape)
vim.opt.autoread = true     -- Auto-reload file if changed outside Vim
vim.opt.autowrite = false   -- Don't auto-save before commands like :make

-- Behavior settings
vim.opt.hidden = true                   -- Allow switching buffers without saving
vim.opt.errorbells = false              -- Disable beep/flash on errors
vim.opt.backspace = "indent,eol,start"  -- Allow backspace over everything in insert mode
vim.opt.autochdir = false               -- Don't change working directory to current file
vim.opt.iskeyword:append("-")           -- Treat hyphens as part of words (useful for CSS, kebab-case)
vim.opt.path:append("**")               -- Search recursively down into subfolders for :find
vim.opt.selection = "exclusive"         -- Visual selection doesn't include the character under cursor at end
vim.opt.mouse = "a"                     -- Enable mouse support in all modes
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard (+ register) by default
vim.opt.modifiable = true               -- Allow buffer to be modified
vim.opt.encoding = "utf-8"              -- Internal encoding
vim.opt.fileencoding = "utf-8"          -- File encoding when writing

-- Folding settings
vim.opt.foldmethod = "expr"                         -- Use expression-based folding (required for Treesitter)
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Treesitter-powered folding
vim.opt.foldlevel = 99                              -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true -- New horizontal splits open below current window
vim.opt.splitright = true -- New vertical splits open to the right of current window
