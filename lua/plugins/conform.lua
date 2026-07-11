vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })

require("conform").setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		local enabled_filetypes = {
			lua = true,
			javascript = true,
			typescript = true,
			html = true,
			json = true,
			jsonc = true,
		}

		if not enabled_filetypes[vim.bo[bufnr].filetype] then
			return nil
		end

		return {
			timeout_ms = 500,
			lsp_format = "fallback",
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		zig = { "zigfmt" },
		kotlin = { "ktlint" },
		javascript = { "biome" },
		typescript = { "biome" },
		html = { "biome" },
		json = { "biome" },
		jsonc = { "biome" },
	},
	formatters = {
		ktlint = {
			args = { "--format", "--stdin", "--log-level=none" },
			stdin = true,
			exit_codes = { 0, 1 },
			stderr = false,
		},
	},
})
