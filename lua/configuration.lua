-- leader key
vim.g.mapleader = ","

-- use global clipboard
vim.opt.clipboard = "unnamedplus"

-- use git against backup files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- autoreload files (when change git branch)
vim.opt.autoread = true

-- show filename in title
vim.opt.title = true

-- minimum indentation from top/bottom of screen to highlighted result on searching
vim.opt.scrolloff = 6

-- explicitly set it to "rg --vimgrep", otherwise "rg --vimgrep -uu" is used (don't know what exactly sets this).
-- The -uu option is used to include all files in the search, even hidden and ignored files.
-- Ignored files are set by configuration to EasyGrep.
vim.opt.grepprg = "rg --vimgrep"

-- show numbers
vim.opt.number = true

-- size of the saved command-lines in a history table
vim.opt.history = 1000

-- disable wrapping strings (when they are very long)
vim.opt.wrap = false

-- show spaces and tabs
vim.opt.list = true
vim.opt.listchars = "tab:▷⋅,trail:⋅,nbsp:⋅"

-- order when opening new splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- allow hidden buffers
vim.opt.hidden = true

-- shows vertical bar
vim.wo.colorcolumn = "120"

-- highlights whole line under cursor. makes neovim slower a bit.
vim.opt.cursorline = true

-- undo changes between sessions
vim.opt.undofile = true

-- set tab size
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- replace tabs to spaces
vim.opt.expandtab = true

--  only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)
vim.opt.smarttab = true

-- reserve a column for language client/gitgutter notifications even if nothing to show
vim.opt.signcolumn = "yes"

-- when first letter is lowercased then search is case-insensitive, sensitive otherwise
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- https://www.cs.swarthmore.edu/oldhelp/vim/modelines.html
vim.opt.modeline = true
vim.opt.modelines = 5

-- navigate between splits
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true })

-- create vertical split
vim.api.nvim_set_keymap("n", "|", ":vsplit<CR>", { noremap = true })
-- create horizontal split
vim.api.nvim_set_keymap("n", "_", ":split<CR>", { noremap = true })

-- alternative exit from insert mode
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })

-- turn search off
vim.api.nvim_set_keymap("n", "<leader><space>", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })

-- replace default search with search by regex
vim.api.nvim_set_keymap("n", "/", "/\\v", { noremap = true })
vim.api.nvim_set_keymap("v", "/", "/\\v", { noremap = true })

-- copy file path to `unnamedplus` clipboard
vim.api.nvim_set_keymap(
    "n",
    "cp",
    [[:let @+ = expand("%")<CR>]],
    { noremap = true, desc = "Copy file path to `unnamedplus` clipboard" }
)

-- command-mode completion
vim.api.wildmenu = true
-- Wildmenu ignores case
vim.api.wildignorecase = true

-- use custom vertical line between splits that is aligned to the left, so it looks nice when splits
-- have different colors (nvim-tree has custom background)
vim.opt.fillchars = "vert:▏"
-- vertical diff
vim.opt.diffopt = "filler,internal,algorithm:histogram,indent-heuristic"

-- mouse support
vim.o.mouse = "a"
