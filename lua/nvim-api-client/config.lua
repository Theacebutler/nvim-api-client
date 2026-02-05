local width = math.floor(vim.o.columns * 0.8)
local height = math.floor(vim.o.lines * 0.8)
local col = math.floor((vim.o.columns - width) / 2)
local row = math.floor((vim.o.lines - height) / 2)
local quarter = 11
local methods = require("nvim-api-client.methods")
local windows = {
	methods.get_win,
	methods.post_win,
	methods.put_win,
	methods.delete_win,
	methods.patch_win,
	background_win = {
		win = nil,
		buff = nil,
		selectable = false,
		opts = {
			modifiable = false,
		},
		config = {
			border = "rounded",
			relative = "editor",
			style = "minimal",
			row = row - 1,
			col = col - 1,
			width = width + 2,
			height = height + 2,
			zindex = 1,
		},
	},
	url = {
		win = nil,
		buff = nil,
		selectable = false,
		opts = {
			modifiable = true,
		},
		config = {
			relative = "editor",
			style = "minimal",
			border = "rounded",
			row = row + 3,
			col = col + 1,
			width = width - 4,
			height = 1,
			zindex = 2,
		},
	},
	display_method = {
		win = nil,
		buff = nil,
		selectable = false,
		text = "METHOD",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			style = "minimal",
			border = "none",
			row = row + 4,
			col = col + 2,
			width = quarter,
			height = 1,
			zindex = 3,
		},
	},
	prefix = {
		win = nil,
		buff = nil,
		selectable = false,
		text = "http://",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			style = "minimal",
			border = "none",
			row = row + 4,
			col = col + 2 + quarter,
			width = 8,
			height = 1,
			zindex = 3,
		},
	},
	url_field = {
		win = nil,
		buff = nil,
		selectable = true,
		opts = {
			modifiable = true,
		},
		config = {
			relative = "editor",
			style = "minimal",
			row = row + 4,
			col = col + 10 + quarter,
			width = width - 15 - quarter,
			height = 1,
			zindex = 3,
		},
	},
	body = {
		win = nil,
		buff = nil,
		selectable = true,
		opts = {
			modifiable = true,
		},
		config = {
			border = "rounded",
			relative = "editor",
			style = "minimal",
			row = row + 6,
			col = col + 1,
			width = width - 4,
			height = height - 10,
			zindex = 3,
		},
	},
}

return windows
