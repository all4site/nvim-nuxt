local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
		local vue_pkg_path =
			vim.fs.joinpath(mason_packages, "vue-language-server", "node_modules", "@vue", "language-server")

        lspconfig.vtsls.setup({
			filetypes = { "vue", "javascript", "javascriptreact", "typescript", "typescriptreact" },
			capabilities = capabilities,
			settings = {
				vtsls = {
					-- autoUseWorkspaceTsdk = true,
					tsserver = {
						preferences = {
							importModuleSpecifier = "non-relative",
							importModuleSpecifierPreference = "non-relative",
						},
						globalPlugins = {
							{
								name = "@vue/typescript-plugin",
								location = vue_pkg_path,
								languages = { "vue" },
								configNamespace = "typescript",
								enableForWorkspaceTypeScriptVersions = true,
							},
						},
					},
				},
			},
		})

		lspconfig.cssls.setup({
			filetypes = { "css", "scss", "sass" },
			capabilities = capabilities,
		})
		lspconfig.cssmodules_ls.setup({
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			capabilities = capabilities,
		})
		lspconfig.css_variables.setup({
			filetypes = { "css", "scss", "less" },
			capabilities = capabilities,
		})
		lspconfig.somesass_ls.setup({
			filetypes = { "scss", "less", "vue" },
			capabilities = capabilities,
		})
		lspconfig.emmet_language_server.setup({
			filetypes = { "typescriptreact", "html", "vue" },
			capabilities = capabilities,
		})
	end,
}
