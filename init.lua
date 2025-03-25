-- Hi there!
-----------------------------
--   ______      __         
--  /_  __/___ _/ /_  ____ _
--   / / / __ `/ __ \/ __ `/
--  / / / /_/ / / / / /_/ / 
-- /_/  \__,_/_/ /_/\__,_/  
-----------------------------
-- My neovim configs

-- here is my opt settings
require("taha.opt")

-- here is my remaps, make sure that they are required before requiring lazy in order for leader to work
require("taha.remap")

-- lazy config
require("taha.lazy")

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Hightlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
