return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2", "-ci" }, -- 2 пробела и авто-отступ для case/esac
				},
			},

			format_on_save = {
				timeout_ms = 3000,
				lsp_fallback = true,
			},

			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },
				vue = { "prettier", "eslint_d", "stylelint" },
				javascript = { "eslint_d" },
				typescript = {  "prettier" },
				html = { "eslint_d" },
				css = { "stylelint" },
				scss = { "stylelint" },
				json = { "eslint_d", "prettier" },
				yaml = { "eslint_d" },
				markdown = { "eslint_d" },
			},
		})
	end,
}
