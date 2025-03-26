return {
	{
		'christoomey/vim-tmux-navigator',
		config = function()
			-- Define the key mappings for Alt + hjkl
			vim.keymap.set('n', '<M-h>', '<cmd>TmuxNavigateLeft<cr>', { desc = "Navigate left" })
			vim.keymap.set('n', '<M-j>', '<cmd>TmuxNavigateDown<cr>', { desc = "Navigate down" })
			vim.keymap.set('n', '<M-k>', '<cmd>TmuxNavigateUp<cr>', { desc = "Navigate up" })
			vim.keymap.set('n', '<M-l>', '<cmd>TmuxNavigateRight<cr>', { desc = "Navigate right" })

		end
	}
}

