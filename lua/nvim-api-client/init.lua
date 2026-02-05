local M = {}
M.selectable_windoes = {}
local config = require("nvim-api-client.config")
local function open_window(window)
	window.buff = vim.api.nvim_create_buf(false, true)
	local w = vim.api.nvim_open_win(window.buff, true, window.config)
	-- this sets the windows to jump to
	if window.selectable then
		M.selectable_windoes[#M.selectable_windoes + 1] = w
	end
	local win_text = window.text or ""
	local padding = string.rep(" ", (window.config.width - #win_text) / 2)
	local text = padding .. win_text
	vim.api.nvim_buf_set_lines(window.buff, 0, -1, false, { text })
	for opt, value in pairs(window.opts) do
		vim.api.nvim_set_option_value(opt, value, { buf = window.buff })
	end
	vim.keymap.set("n", "<S-TAB>", function()
		M.down()
	end, { buffer = window.buff })
	vim.keymap.set("n", "<TAB>", function()
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
		vim.cmd("startinsert")
	end
end

M.hide = function()
	for _, section in pairs(config) do
		if section.win and vim.api.nvim_win_is_valid(section.win) then
			vim.api.nvim_win_hide(section.win)
		end
	end
	M.selectable_windoes = {}
end

M.toggle = function()
	if #M.selectable_windoes > 1 then
		M.hide()
	else
		M.show()
	end
end
-- Nav
M.down = function()
	local c_win = vim.api.nvim_get_current_win()
	for index, value in ipairs(M.selectable_windoes) do
		if c_win == value then
			if M.selectable_windoes[index - 1] and vim.api.nvim_win_is_valid(M.selectable_windoes[index - 1]) then
				vim.api.nvim_set_current_win(M.selectable_windoes[index - 1])
			else
				vim.api.nvim_set_current_win(M.selectable_windoes[#M.selectable_windoes])
			end
		end
	end
end

M.up = function()
	local c_win = vim.api.nvim_get_current_win()
	for index, value in ipairs(M.selectable_windoes) do
		if c_win == value then
			if M.selectable_windoes[index + 1] and vim.api.nvim_win_is_valid(M.selectable_windoes[index + 1]) then
				vim.api.nvim_set_current_win(M.selectable_windoes[index + 1])
			else
				vim.api.nvim_set_current_win(M.selectable_windoes[1])
			end
		end
	end
end

return M
