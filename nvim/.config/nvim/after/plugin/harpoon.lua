local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>t1", function() term.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>t2", function() term.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>t3", function() term.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>t4", function() term.gotoTerminal(2) end)

vim.keymap.set("n", "<leader>jj", function() ui.nav_next() end)
vim.keymap.set("n", "<leader>kk", function() ui.nav_prev() end)

require("harpoon").setup({
    mark_branch = true,
})
