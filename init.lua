-- Hi there!
-----------------------------
--   ______      __         
--  /_  __/___ _/ /_  ____ _
--   / / / __ `/ __ \/ __ `/
--  / / / /_/ / / / / /_/ / 
-- /_/  \__,_/_/ /_/\__,_/  
-----------------------------
-- My neovim configs
-- This is not a direct copy paste from other configs (like kickstart, I wish I could copy and paste)
-- as one of the main reasons to switch from vscode to neovim is to know my environment well, if I
-- simply cloned kickstart, so what is the point.
-- However, a lot of inspiration taken form kickstart (or other people config), but not direct copy paste,
-- I will try to understand well every bit of code and customize it for my needs, it is a lifelong journey, let's go! 


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
