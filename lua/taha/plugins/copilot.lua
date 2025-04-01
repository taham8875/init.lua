return {
    "github/copilot.vim",
    config = function()
        -- remap shif tab to accept one line
        vim.api.nvim_set_keymap("i", "<S-Tab>", "<Plug>(copilot-accept-line)", { silent = true })
    end,
}
