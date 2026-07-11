return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },

		-- Allows extra capabilities provided by blink.cmp
		"saghen/blink.cmp",
	},
	config = function()
		--  This function gets run when an LSP attaches to a particular buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
				map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
				map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
				map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

				local function client_supports_method(client, method, bufnr)
					if vim.fn.has("nvim-0.11") == 1 then
						return client:supports_method(method, bufnr)
					else
						return client.supports_method(method, { bufnr = bufnr })
					end
				end

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if
					client
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
				then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if
					client
					and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
				then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		-- Diagnostic Config
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		-- Capabilities from blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Define server configurations using vim.lsp.config (Neovim 0.11+)
		-- The name passed to vim.lsp.config can be any identifier, but using the
		-- server name keeps things clear. You define the config once...
		vim.lsp.config("lua_ls", {
			-- cmd, filetypes, and root_markers are optional if nvim-lspconfig
			-- provides defaults for this server name, but being explicit is safer.
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		vim.lsp.enable("lua_ls")

		vim.lsp.config('clangd', {
		  cmd = { 'clangd' },
		  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
		  root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', '.git' },
		  capabilities = capabilities,
		})
		vim.lsp.enable('clangd')

		-- vim.lsp.config('gopls', {
		--   cmd = { 'gopls' },
		--   filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
		--   root_markers = { 'go.mod', 'go.work', '.git' },
		--   capabilities = capabilities,
		-- })
		-- vim.lsp.enable('gopls')
	end,
}
