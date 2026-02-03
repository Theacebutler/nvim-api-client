-- local w_10 = math.floor(vim.o.columns * 0.1)
-- local h_10 = math.floor(vim.o.lines * 0.1)
local width = math.floor(vim.o.columns * 0.8)
local height = math.floor(vim.o.lines * 0.8)
local col = math.floor((vim.o.columns - width) / 2)
local row = math.floor((vim.o.lines - height) / 2)
local quarter = 11
local windows = {
	background_win = {
		win = nil,
		buff = nil,
		config = {
			relative = "editor",
			style = "minimal",
			row = row,
			col = col,
			width = width,
			height = height,
			zindex = 1,
		},
	},
	get_win = {
		win = nil,
		buff = nil,
		text = "GET",
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col,
			width = quarter,
			height = 1,
		},
	},
	post_win = {
		win = nil,
		buff = nil,
		text = "POST",
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col + quarter + 2,
			width = quarter,
			height = 1,
		},
	},
	put_win = {
		win = nil,
		buff = nil,
		text = "PUT",
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col + (quarter * 2) + 4,
			width = quarter,
			height = 1,
		},
	},
	delete_win = {
		win = nil,
		buff = nil,
		text = "DELETE",
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col + (quarter * 3) + 6,
			width = quarter,
			height = 1,
		},
	},
	prefix = {
		win = nil,
		buff = nil,
		text = "http://",
		config = {
			relative = "editor",
			style = "minimal",
			border = "none",
			row = row + 4,
			col = col + 2,
			width = 10,
			height = 1,
			zindex = 3,
		},
	},
	url = {
		win = nil,
		buff = nil,
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
	body = {
		win = nil,
		buff = nil,
		config = {
			border = "rounded",
			relative = "editor",
			style = "minimal",
			row = row + 6,
			col = col + 1,
			width = width - 4,
			height = height - 10,
		},
	},
}

return windows
