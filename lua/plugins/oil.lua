return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	config = function()
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
	end,

	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
