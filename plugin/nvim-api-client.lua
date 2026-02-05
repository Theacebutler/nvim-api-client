local plugin = require("nvim-api-client")
return {
	vim.keymap.set("n", "<F2>", function()
		plugin.toggle()
	end),
}
