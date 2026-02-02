local w_10 = math.floor(vim.o.columns * 0.1)
local h_10 = math.floor(vim.o.lines * 0.1)
local width = math.floor(vim.o.columns * 0.8)
local height = math.floor(vim.o.lines * 0.8)
local col = math.floor((vim.o.columns - width) / 2)
local row = math.floor((vim.o.lines - height) / 2)

local M = {}
local win = nil
local url_buff = nil
local method_buff = nil
---@type vim.api.keyset.win_config
local windows = {
	method = {
		win = nil,
		buff = nil,
		config = {
			relative = "editor",
			style = "minimal",
			border = "double",
			row = row,
			col = col,
			width = width,
			height = 1,
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
			col = col,
			width = width,
			height = 1,
		},
	},
	body = {
		win = nil,
		buff = nil,
		config = {
			relative = "editor",
			style = "minimal",
			border = { "+", "+", "+", "+", "+", "+", "+", "+" },
			row = row + 6,
			col = col,
			width = width,
			height = height,
		},
	},
}

local function open_window(opts)
	local buff = vim.api.nvim_create_buf(false, true)
	local w = vim.api.nvim_open_win(buff, true, opts.config)
	return buff, w
end

-- Toggle
local function show()
	windows.url.buff, windows.url.win = open_window(windows.url)
	windows.body.buff, windows.body.win = open_window(windows.body)
	windows.method.buff, windows.method.win = open_window(windows.method)
end

local function hide()
	for _, section in pairs(windows) do
		if section.win and vim.api.nvim_win_is_valid(section.win) then
			vim.api.nvim_win_hide(section.win)
		else
		end
	end
end

M.toggle = function()
	if windows.url.win and vim.api.nvim_win_is_valid(windows.url.win) then
		hide()
	else
		show()
	end
end

vim.api.nvim_create_user_command("OpenWind", function()
	M.toggle()
end, {})

vim.keymap.set({ "i", "n", "v" }, "<leader>al", function()
	M.toggle()
end)

return M
