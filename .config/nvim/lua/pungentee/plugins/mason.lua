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
				-- lsps

				"lua_ls",
				"bashls",
				"docker_compose_language_service",
				"dockerls",
				"jsonls",
				"sqlls",
				"marksman",

                -- rust
				"rust_analyzer",

                -- c, c++
                "clangd",
                "cmake",

				-- go
				"gopls",

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
				-- another tooling

				"clang-format", -- c, c++
				"gersemi",
				"markdownlint",
				"sql-formatter",
				"cpplint",
				"jsonlint",
				"yamllint",
				"hadolint",

				-- go
				"gofumpt",
				"goimports",
				"golines",
				"golangci-lint",

				-- lua
				"stylua",

				-- haskell
				"fourmolu",
				"hlint",
			},
		},
	},
}
