return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			gcc = { "isort", "black" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			go = { "gofumpt", "goimports" },
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettier", stop_after_first = true },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
		})
	end,
	dependencies = {
		"mason-org/mason.nvim",
	},
}
