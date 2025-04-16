return {

	"github/copilot.vim",
	config = function()
		-- remap shif tab to accept one line
		vim.api.nvim_set_keymap("i", "<S-Tab>", "<Plug>(copilot-accept-line)", { silent = true })
		vim.keymap.set("i", "<Esc>", function()
			-- Check if Copilot has an active suggestion
			if vim.fn["copilot#GetDisplayedSuggestion"]().text ~= "" then
				-- Dismiss the suggestion if it exists
				vim.fn["copilot#Dismiss"]()
				return "" -- Stay in insert mode
			else
				-- Default <Esc> behavior (exit insert mode)
				return "<Esc>"
			end
		end, { expr = true, noremap = true })
	end,
}
