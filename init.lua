-- a lot of this is taken from the glorious kickstart https://github.com/nvim-lua/kickstart.nvim
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require("options")
require("keymaps")
require("autocommands")
require("plugins")
-- local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
-- for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
-- 	if file:match("%.lua$") then
-- 		local name = file:gsub("%.lua$", "")
-- 		require("plugins." .. name)
-- 	end
-- end
