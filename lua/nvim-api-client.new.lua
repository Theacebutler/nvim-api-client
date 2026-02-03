--:TODO:
-- Add navigation between the windows
-- Fill the method buffer with POST GET PUT and DELETE
-- Get the method from the user
-- Add a http:// prefix to the url buffer
-- Save the url from the user input
-- Add a basic request schema and add option to edit it
-- Send the curl request
-- Show the response and the status code

local M = {}
local config = require("config")
local function open_window(window)
	window.buff = vim.api.nvim_create_buf(false, true)
	local w = vim.api.nvim_open_win(window.buff, true, window.config)
	local win_text = window.text or ""
	local padding = string.rep(" ", (window.config.width - #win_text) / 2)
	local text = padding .. win_text
	vim.api.nvim_buf_set_lines(window.buff, 0, -1, false, { text })
	return w
end

-- Toggle
M.show = function()
	for key, _ in pairs(config) do
		config[key].win = open_window(config[key])
	end
end

M.hide = function()
	for _, section in pairs(config) do
		if section.win and vim.api.nvim_win_is_valid(section.win) then
			vim.api.nvim_win_hide(section.win)
		end
	end
end

M.toggle = function()
	if config.url.win and vim.api.nvim_win_is_valid(config.url.win) then
		M.hide()
	else
		M.show()
	end
end

return M
