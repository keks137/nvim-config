local plugins_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins")
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
	if (type == "file" or type == "link") and file_name:match("%.lua$") and file_name ~= "init.lua" then
		local module = file_name:gsub("%.lua$", "")
		require("plugins." .. module)
	end
end

vim.pack.add({ "https://github.com/norcalli/nvim-colorizer.lua" })
require("colorizer").setup()
vim.pack.add({ "https://github.com/folke/todo-comments.nvim" })
require("todo-comments").setup({ signs = false })
