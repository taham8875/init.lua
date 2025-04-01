-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "errormsg" },
            { out,                            "warningmsg" },
            { "\npress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- put lazy into the runtimepath for neovim
vim.opt.runtimepath:prepend(lazypath)

-- setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "taha.plugins" },
        -- some plugins are simple, not worth to move them to the plugins folders
        -- 'tpope/vim-sleuth', -- auto detect what the current file uses (tabs vs spaces, 2 or 4 or 8 space indent

        -- highlight todo, notes, etc in comments
        {
            "folke/todo-comments.nvim",
            event = "vimenter",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = { signs = false },
        },

        {
            "kylechui/nvim-surround",
            version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
            event = "VeryLazy",
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end,
        },
    },

    -- configure any other settings here. see the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
