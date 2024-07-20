return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"bashls",
				"clangd",
				"cmake",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"jsonls",
				"sqlls",
				"marksman",
				"rust_analyzer",

				-- python
				"ruff",
				"pyright",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				-- golang
				"gofumpt",
				"goimports",
				"golines",
				"golangci-lint",

				"clang-format",
				"gersemi",
				"markdownlint",
				"sql-formatter",
				"cpplint",
				"jsonlint",
				"yamllint",
				"hadolint",

				-- lua
				"stylua",

				-- haskell
				"fourmolu",
				"hlint",
			},
		},
	},
}
