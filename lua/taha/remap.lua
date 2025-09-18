-- set the leader key to space, must happend before any other plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clear highlight on search on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move selected line up or down while respecting the indenting
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join lines while keeping the cursor in its original position
vim.keymap.set("n", "J", "mzJ`z")

-- reindent the entire paragraph while keeping the cursor in its original position
vim.keymap.set("n", "=ap", "ma=ap'a")

-- sometimes i don't want things to go to the system clipboard
vim.keymap.set("n", "<leader>y", '"my', { noremap = true })
vim.keymap.set("v", "<leader>y", '"my', { noremap = true })
vim.keymap.set("n", "<leader>d", '"md', { noremap = true })
vim.keymap.set("v", "<leader>d", '"md', { noremap = true })

-- find and replace the current word, case insensitive
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- select all
vim.keymap.set("n", "<leader>vv", "gg<S-v>G")

-- don't lose selection when shifting sidewards
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- if err != nil {
--    return err
-- }
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
