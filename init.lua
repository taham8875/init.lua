require("taha")
require("taha.remap")
require("taha.packer")
print("hello")

vim.o.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.signcolumn = 'yes'

-- highlight on search, clear on pressing esc in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Hightlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
