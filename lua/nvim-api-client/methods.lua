local utils = require("nvim-api-client.utils")
return {
	get_win = {
		win = nil,
		buff = nil,
		text = "GET",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = utils.row,
			col = utils.col + 1,
			width = utils.quarter,
			height = 1,
		},
	},
	post_win = {
		win = nil,
		buff = nil,
		text = "POST",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = utils.row,
			col = utils.col + utils.quarter + 3,
			width = utils.quarter,
			height = 1,
		},
	},
	put_win = {
		win = nil,
		buff = nil,
		text = "PUT",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = utils.row,
			col = utils.col + (utils.quarter * 2) + 5,
			width = utils.quarter,
			height = 1,
		},
	},
	delete_win = {
		win = nil,
		buff = nil,
		text = "DELETE",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = utils.row,
			col = utils.col + (utils.quarter * 3) + 7,
			width = utils.quarter,
			height = 1,
		},
	},
	patch_win = {
		win = nil,
		buff = nil,
		text = "PATCH",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = utils.row,
			col = utils.col + (utils.quarter * 4) + 9,
			width = utils.quarter,
			height = 1,
		},
	},
}
