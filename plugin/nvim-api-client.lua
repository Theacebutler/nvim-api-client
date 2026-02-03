local plugin = require("nvim-api-client")
return {
	vim.keymap.set("n", "<F1>", function()
		plugin.toggle()
	end),
}
