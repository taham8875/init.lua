return {
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			-- Added lines (green)
			vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#6A9955' })

			-- Modified lines (blue)
			vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#0a6fc1' })

			-- Deleted lines (red)
			vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#E06C75' })

			-- Changed and deleted lines (purple)
			vim.api.nvim_set_hl(0, 'GitSignsChangeDelete', { fg = '#C678DD' })

			-- Untracked lines (gray)
			vim.api.nvim_set_hl(0, 'GitSignsUntracked', { fg = '#5c6370' })


            vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#5c6370', italic = true })

			require('gitsigns').setup({
				signs = {
					add          = { text = '┃', },
					change       = { text = '┃', },
					delete       = { text = '_', },
					topdelete    = { text = '‾', },
					changedelete = { text = '~', },
					untracked    = { text = '┆', },
				},
				signs_staged = {
					add          = { text = '┃', },
					change       = { text = '┃', },
					delete       = { text = '_', },
					topdelete    = { text = '‾', },
					changedelete = { text = '~', },
					untracked    = { text = '┆', },
				},
				signs_staged_enable = true,
				signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
				numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = 'single',
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
			})
		end,
	}
}

