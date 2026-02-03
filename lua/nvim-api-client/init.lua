local M = {}
local config = require("nvim-api-client.config")
local function open_window(window)
	window.buff = vim.api.nvim_create_buf(false, true)
	local w = vim.api.nvim_open_win(window.buff, true, window.config)
	local win_text = window.text or ""
	local padding = string.rep(" ", (window.config.width - #win_text) / 2)
	local text = padding .. win_text
	vim.api.nvim_buf_set_lines(window.buff, 0, -1, false, { text })
	-- vim.keymap.set("n", "j", function()
	-- 	M.down()
	-- end, { buffer = window.buff })
	vim.keymap.set("n", "k", function()
		M.up()
	end, { buffer = window.buff })
	vim.keymap.set("n", "q", function()
		M.hide()
	end, { buffer = window.buff })
	vim.keymap.set("n", "<ESC>", function()
		M.hide()
	end, { buffer = window.buff })
	return w
end

-- Toggle
M.show = function()
	for key, _ in pairs(config) do
		config[key].win = open_window(config[key])
	end
	local url_win = config.url_field.win
	if url_win and vim.api.nvim_win_is_valid(url_win) then
		vim.api.nvim_set_current_win(url_win)
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
-- Nav
M.up = function()
	-- local current_win = vim.api.nvim_get_current_win()
	local all_windows = vim.api.nvim_list_wins()

	local url_win = config.url_field.win
	if url_win and vim.api.nvim_win_is_valid(url_win) then
		vim.api.nvim_set_current_win(url_win)
	end
end
return M
