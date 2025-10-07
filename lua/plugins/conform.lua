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
				json = { "prettier" },
				vue = { "prettier", "stylelint" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "stylelint" },
				scss = { "stylelint" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
		})
	end,
}
