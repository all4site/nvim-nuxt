return {
	"akinsho/bufferline.nvim",
	requires = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				offsets = {
					{ filetype = "neo-tree" },
				},
				close_command = "bp|sp|bn|bd",
				name_formatter = function(buf)
					local bufnr = buf.bufnr or buf.id
					if not bufnr or type(bufnr) ~= "number" then
						return buf.name or ""
					end

					local filepath = vim.api.nvim_buf_get_name(bufnr)
					if filepath == "" then
						return buf.name or ""
					end

					local relative_path = vim.fn.fnamemodify(filepath, ":.")

					local parts = {}
					for part in string.gmatch(relative_path, "[^/\\]+") do
						table.insert(parts, part)
					end

					local count = #parts
					local start = math.max(1, count - 2)

					local display_parts = {}
					for i = start, count do
						table.insert(display_parts, parts[i])
					end

					return table.concat(display_parts, "/")
				end,
			},
			highlights = {
				buffer_selected = {
					fg = "#98c379",
					bold = true,
					italic = false,
				},
			},
		})
	end,
}
