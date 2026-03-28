return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
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
			kotlin = { "ktlint" },

			javascript = { "biome" },
			typescript = { "biome" },
			html = { "biome" },
			json = { "biome" },
			jsonc = { "biome" },

			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		formatters = {
			ktlint = {

				args = {
					"--format",
					"--stdin",
					"--log-level=none",
				},
				stdin = true,

				exit_codes = { 0, 1 },

				stderr = false,
			},
		},
	},
}
