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
				"eslint",
				"gopls",
				"html",
				"jsonls",
				"pyright",
				"sqlls",
				"marksman",
				"rust_analyzer",
				"julials",
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
                "gofumpt",
                "goimports",
                "golines",
                "golangci-lint",

				"clang-format",
				"gersemi",
				"prettier",
				"stylua",
				"markdownlint",
				"black",
				"isort",
				"sql-formatter",

				"cpplint",
				"htmlhint",
				"jsonlint",
				"yamllint",
				"pylint",
				"hadolint",
			},
		},
	},
}
