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
				biome = {
					command = "biome",
					args = { "check", "--write", "$FILENAME" },
					stdin = false, -- biome работает с файлом напрямую, а не через stdin
				},
			},

			format_on_save = {
				timeout_ms = 3000,
				lsp_fallback = true,
			},

			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "biome" },
				vue = { "biome", "stylelint" },
				javascript = { "biome" },
				typescript = { "biome" },
				html = { "biome" },
				css = { "stylelint" },
				scss = { "stylelint" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
		})
	end,
}
