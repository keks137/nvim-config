vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>only<CR>', { desc = 'Make [O]nly Window' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>l', vim.lsp.buf.code_action, { desc = 'Open diagnostic Qickfix So[l]ution' }) -- great letter, I know


vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>e', '<cmd>Ex<CR>', { desc = 'Filetree [E]xplorer' })
vim.keymap.set('n', '<leader>Et', '<cmd>term<CR>', { desc = '[T]erminal' })
vim.keymap.set('n', '<leader>Er', ':update <CR>:source ~/.config/nvim/init.lua<CR>',  { desc = '[R]eload config' })
vim.keymap.set('n', '<leader>Et', '<cmd>term<CR>', { desc = '[T]erminal' })

-- emergency format
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, { desc = '[F]ormat' })

