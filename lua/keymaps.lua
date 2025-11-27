vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>only<CR>", { desc = "Make [O]nly Window" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>n", vim.lsp.buf.code_action, { desc = "Open diagnostic Qickfix Solutio[n]" }) -- great letter, I know

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Filetree [E]xplorer" })
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Filetree [E]xplorer" })
vim.keymap.set("n", "<leader>Et", "<cmd>term<CR>", { desc = "[T]erminal" })
vim.keymap.set("n", "<leader>Er", ":update <CR>:source ~/.config/nvim/init.lua<CR>", { desc = "[R]eload config" })
vim.keymap.set("n", "<leader>Et", "<cmd>term<CR>", { desc = "[T]erminal" })

-- emergency format
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "[F]ormat" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = "Toggle LSP [D]iagnostics" })

-- disable pageup and pagedown
vim.keymap.set("", "<PageUp>", "<Nop>")
vim.keymap.set("", "<PageDown>", "<Nop>")
vim.keymap.set("i", "<PageUp>", "<Nop>")
vim.keymap.set("i", "<PageDown>", "<Nop>")
