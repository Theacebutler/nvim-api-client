local width = math.floor(vim.o.columns * 0.8)
local height = math.floor(vim.o.lines * 0.8)
local col = math.floor((vim.o.columns - width) / 2)
local row = math.floor((vim.o.lines - height) / 2)
local quarter = 11

return {
	get_win = {
		win = nil,
		buff = nil,
		selectable = true,
		text = "GET",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col + 1,
			width = quarter,
			height = 1,
		},
	},
	post_win = {
		win = nil,
		buff = nil,
		selectable = true,
		text = "POST",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col + quarter + 3,
			width = quarter,
			height = 1,
		},
	},
	put_win = {
		win = nil,
		buff = nil,
		selectable = true,
		text = "PUT",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col + (quarter * 2) + 5,
			width = quarter,
			height = 1,
		},
	},
	delete_win = {
		win = nil,
		buff = nil,
		selectable = true,
		text = "DELETE",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col + (quarter * 3) + 7,
			width = quarter,
			height = 1,
		},
	},
	patch_win = {
		win = nil,
		buff = nil,
		selectable = true,
		text = "PATCH",
		opts = {
			modifiable = false,
		},
		config = {
			relative = "editor",
			border = "rounded",
			style = "minimal",
			row = row,
			col = col + (quarter * 4) + 9,
			width = quarter,
			height = 1,
		},
	},
}
