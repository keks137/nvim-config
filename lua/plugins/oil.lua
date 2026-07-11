vim.pack.add({
	"https://github.com/echasnovski/mini.icons",
	"https://github.com/stevearc/oil.nvim",
})

require("mini.icons").setup({})

require("oil").setup({
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, bufnr)
			return name == ".."
		end,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	},
})
