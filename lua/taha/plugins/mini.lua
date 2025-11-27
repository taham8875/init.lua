return {
	{
		'echasnovski/mini.nvim',
		config = function()
			-- ============================================
			-- PROJECT-WIDE DIAGNOSTICS FOR STATUSLINE
			-- ============================================

			-- Cache for diagnostic counts (performance optimization)
			local diagnostic_cache = {
				counts = { errors = 0, warnings = 0, info = 0, hints = 0 },
				last_update = 0,
			}

			-- Aggregate diagnostics across all loaded buffers
			local function get_project_diagnostics()
				local now = vim.loop.now()

				-- Return cached value if fresh (< 200ms old)
				if now - diagnostic_cache.last_update < 200 then
					return diagnostic_cache.counts
				end

				local error_count = 0
				local warn_count = 0
				local info_count = 0
				local hint_count = 0

				-- Get all diagnostics across all buffers in one efficient call
				local all_diagnostics = vim.diagnostic.get(nil)

				for _, diagnostic in ipairs(all_diagnostics) do
					if diagnostic.severity == vim.diagnostic.severity.ERROR then
						error_count = error_count + 1
					elseif diagnostic.severity == vim.diagnostic.severity.WARN then
						warn_count = warn_count + 1
					elseif diagnostic.severity == vim.diagnostic.severity.INFO then
						info_count = info_count + 1
					elseif diagnostic.severity == vim.diagnostic.severity.HINT then
						hint_count = hint_count + 1
					end
				end

				-- Update cache
				diagnostic_cache.counts = {
					errors = error_count,
					warnings = warn_count,
					info = info_count,
					hints = hint_count,
				}
				diagnostic_cache.last_update = now

				return diagnostic_cache.counts
			end

			-- Custom statusline section showing all diagnostic levels
			local function section_project_diagnostics()
				local counts = get_project_diagnostics()
				local parts = {}

				-- Build each severity section with appropriate color
				if counts.errors > 0 then
					table.insert(parts, string.format("%%#DiagnosticError#󰅚 %d%%*", counts.errors))
				end

				if counts.warnings > 0 then
					table.insert(parts, string.format("%%#DiagnosticWarn#󰀪 %d%%*", counts.warnings))
				end

				if counts.info > 0 then
					table.insert(parts, string.format("%%#DiagnosticInfo#󰋽 %d%%*", counts.info))
				end

				if counts.hints > 0 then
					table.insert(parts, string.format("%%#DiagnosticHint#󰌶 %d%%*", counts.hints))
				end

				-- Return empty string if no diagnostics (clean state)
				if #parts == 0 then
					return ""
				end

				return table.concat(parts, " ")
			end

			-- Configure statusline with custom content
			local statusline = require('mini.statusline')
			local MiniStatusline = statusline

			statusline.setup({
				use_icons = true,

				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_git({ trunc_width = 75 })
						local diagnostics = section_project_diagnostics()
						local filename = MiniStatusline.section_filename({ trunc_width = 140 })
						local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
						local location = MiniStatusline.section_location({ trunc_width = 75 })
						local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = 'MiniStatuslineDevinfo', strings = { git } },
							{ hl = 'MiniStatuslineDevinfo', strings = { diagnostics } },
							'%<',  -- Truncation point
							{ hl = 'MiniStatuslineFilename', strings = { filename } },
							'%=',  -- Right-align separator
							{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
							{ hl = mode_hl, strings = { search, location } },
						})
					end,
				},
			})

			-- Auto-update statusline when diagnostics change
			vim.api.nvim_create_autocmd("DiagnosticChanged", {
				group = vim.api.nvim_create_augroup("project-diagnostics-statusline", { clear = true }),
				callback = function()
					diagnostic_cache.last_update = 0  -- Invalidate cache
					vim.cmd("redrawstatus")
				end,
			})

			-- ============================================
			-- OTHER MINI.NVIM MODULES
			-- ============================================

			require('mini.ai').setup({ n_lines = 500 })
		end
	}
}
