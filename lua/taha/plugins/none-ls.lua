return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
            },
        })

        vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})

        -- vim.api.nvim_create_autocmd("InsertLeave", {
        -- 	callback = function()
        -- 		vim.lsp.buf.format({ async = true })
        -- 	end,
        -- })
    end,
}
