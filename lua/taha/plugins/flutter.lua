return {
	{
		'nvim-flutter/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		config = function ()
			require("flutter-tools").setup {
				flutter_path = '/home/taha/flutter/bin/flutter',
				dev_log = {
					enabled = false -- i will open my logs in a new tmux window, better than the side neovim page
				}
			} -- use defaults
		end,
	}
}
