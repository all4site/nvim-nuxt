return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			vue = { "eslint_d" },
		}
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				require("lint").try_lint()
			end,
		})
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	callback = function()
		-- 		-- Проверяем, что eslint_d доступен
		-- 		if vim.fn.executable("eslint_d") == 1 then
		-- 			vim.cmd("EslintFix")
		-- 		end
		-- 	end,
		-- })
	end,
}
