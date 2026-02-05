local methods = require("nvim-api-client.methods")
local utils = require("nvim-api-client.utils")
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
			row = utils.row - 1,
			col = utils.col - 1,
			width = utils.width + 2,
			height = utils.height + 2,
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
			row = utils.row + 3,
			col = utils.col + 1,
			width = utils.width - 4,
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
			row = utils.row + 4,
			col = utils.col + 2,
			width = utils.quarter,
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
			row = utils.row + 4,
			col = utils.col + 2 + utils.quarter,
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
			row = utils.row + 4,
			col = utils.col + 10 + utils.quarter,
			width = utils.width - 15 - utils.quarter,
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
			row = utils.row + 6,
			col = utils.col + 1,
			width = utils.width - 4,
			height = utils.height - 10,
			zindex = 3,
		},
	},
}

return windows
