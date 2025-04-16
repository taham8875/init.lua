return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "davidmh/cspell.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local cspell = require("cspell")

        -- 👇 Add this block to configure global cspell
        local cspell_config = {
            cspell_config_dirs = {
                vim.fn.expand("~/.config/cspell"),
            },
            read_config_synchronously = true,
            on_add_to_json = function(payload)
                -- Optional: auto-format the file using jq
                os.execute(
                    string.format(
                        "jq -S '.words |= sort' %s > %s.tmp && mv %s.tmp %s",
                        payload.cspell_config_path,
                        payload.cspell_config_path,
                        payload.cspell_config_path,
                        payload.cspell_config_path
                    )
                )
            end,
        }

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.htmlbeautifier,
                null_ls.builtins.formatting.rufo,
                null_ls.builtins.diagnostics.rubocop,
                -- 👇 Inject custom config here
                cspell.diagnostics.with({
                    config = cspell_config,
                    diagnostics_postprocess = function(diagnostic)
                        diagnostic.severity = vim.diagnostic.severity.HINT
                    end,
                }),
                cspell.code_actions.with({
                    config = cspell_config,
                }),
            },
        })

        vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})

        vim.keymap.set("n", "<leader>ww", function()
            vim.lsp.buf.format({ async = false })
            vim.cmd("wa")
        end, { desc = "Format and Save" })

        -- vim.api.nvim_create_autocmd("InsertLeave", {
        --
        -- 	callback = function()
        -- 		vim.lsp.buf.format({ async = true })
        -- 	end,
        -- })
    end,
}
