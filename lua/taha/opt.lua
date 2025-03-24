-- I like to have nerd font for good-looking symbols and icons
vim.g.have_nerd_font = true

-- set the number and relative numbers for easy jumps
vim.opt.number = true
vim.opt.relativenumber = true

-- disable swap files and it annoyes every time I open and close neovim
-- TODO: search for what is the root problem and how to use swap files properly
vim.o.swapfile = false

-- enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between os and neovim
-- I have used to this in vscode, no intent to change
-- I am using copyq btw
-- scheduled to prevent increasing the startup time
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

-- save undo history between sessions
vim.opt.undofile = true

-- Case insensitive search unless using \C or the search term has on or more capital letters
-- so /dog matched dog, Dog and DOG
-- /Dog, matched only Dog
-- /\Cdog, matches dog
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep the sign column by default
vim.opt.signcolumn = 'yes'

-- preview substitutions live, as you type
vim.opt.inccommand = 'split'

-- show (highlight) which line the cursor is on
-- idk if i like it or not
vim.opt.cursorline = true

-- Minimal number of lines to keep above and below the cursor on scrolling
vim.opt.scrolloff = 10

-- if performing an operation that may fail due to unsaved changes (like `:q`)
-- show a dialog asking if you wish to save the current files
vim.opt.confirm = true

-- highlight on search, clear on pressing esc in normal mode
vim.opt.hlsearch = true
