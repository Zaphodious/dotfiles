-- Remaps are in after/plugin/ because for some rason
-- they weren't working when included in the usual
-- source path. Stupid, but whatever, it works.

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ss", vim.cmd.PackerSync)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("<leader>wv", vim.

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>ww", "<C-w>v")
vim.keymap.set("n", "<leader>we", "<C-w>n")
vim.keymap.set("n", "<leader>wx", "<C-w>q")
vim.keymap.set("n", "<leader>wr", "<C-w>80|")
vim.keymap.set("n", "<leader>w=", "<C-w>=")
vim.keymap.set("n", "<tab>l", "<C-w>l")
vim.keymap.set("n", "<tab>k", "<C-w>k")
vim.keymap.set("n", "<tab>j", "<C-w>j")
vim.keymap.set("n", "<tab>h", "<C-w>h")

vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

