return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		config = function()
			local lsp = require("lsp-zero")

			lsp.on_attach(function(client, buffer)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
			end)
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"bashls",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"gopls",
				"html",
				"htmx",
				"jsonls",
				"lua_ls",
				"autotools_ls",
				"pyright",
				"sqlls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- formatters
				"black",
				"prettierd",
				"stylua",
				"shfmt",
				"clang-format",
				-- linters
				"pylint",
				"cpplint",
				"eslint_d",
			},
		},
	},
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local cmp = require("cmp")

			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			return {
				sources = {
					{ name = "nvim_lsp" },
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			}
		end,
	},
}
