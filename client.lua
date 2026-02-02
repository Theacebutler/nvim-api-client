local M = {}

local win = nil
local buff = {
	url = nil,
	body = nil,
	response = nil,
}

local url_history = nil
local history_idx = nil

local function create_buffer()
	local buffer = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buffer, "bufhidden", "hide")
	vim.api.nvim_buf_set_option(buffer, "buflisted", false)
	vim.api.nvim_buf_set_option(buffer, "swapfile", false)
	return buffer
end

local function open_float()
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.columns - width) / 2)
	local col = math.floor((vim.o.lines - height) / 2)

	win = vim.api.nvim_open_win(buff.url, true, {
		relative = "editor",
		style = "minimal",
		border = "rounded",
		width = width,
		height = height,
		row = row,
		col = col,
	})
end

local function setup_layout()
	-- URL Bar
	if win then
		vim.api.nvim_win_set_buf(win, buff.url)
		vim.api.nvim_buf_set_lines(buff.url, 0, -1, false, { "http://" })
		vim.cmd("resize 3")
	end

	-- body
	vim.cmd("split")
	vim.api.nvim_win_set_buf(0, buff.body)
	vim.cmd("resize 10")

	-- -- response
	vim.api.nvim_win_set_buf(0, buff.response)
	vim.cmd("split")
end

-- request
local function ren_request()
	local url = vim.api.nvim_buf_get_lines(buff.url, 0, 1, false)[1]
	local body = table.concat(vim.api.nvim_buf_get_lines(buff.body, 0, -1, false), "\n")
	if not url or url == "" then
		return
	end

	table.insert(url_history, url)
	history_idx = #url_history

	local cmd = {
		"curl",
		"-s",
		"-X",
		"POST",
		"-H",
		"Content-Type: application/json",
		"-d",
		body,
		url,
	}
	local res = vim.fn.system(cmd)
	vim.api.nvim_buf_set_lines(buff.response, 0, -1, false, vim.split(res, "\n"))
end

-- history
local function history_prev()
	if not history_idx or history_idx <= 1 then
		return
	end
	history_idx = history_idx - 1
	vim.api.nvim_buf_set_lines(buff.url, 0, -1, false, { url_history[history_idx] })
end

local function history_next()
	if not history_idx or history_idx >= #url_history then
		return
	end
	history_idx = history_idx + 1
	vim.api.nvim_buf_set_lines(buff.url, 0, -1, false, { url_history[history_idx] })
end
-- public
function M.toggle()
	if win and vim.api.nvim_win_is_valid(win) then
		vim.api.nvim_win_close(win, true)
		return
	end

	if not buff.url then
		buff.url = create_buffer()
		buff.body = create_buffer()
		buff.response = create_buffer()

		vim.api.nvim_buf_set_option(buff.response, "modifiable", false)

		vim.keymap.set("n", "<CR>", ren_request, { buffer = buff.url })
		vim.keymap.set("n", "[u", history_prev, { buffer = buff.url })
		vim.keymap.set("n", "]u", history_next, { buffer = buff.url })
	end

	open_float()
	setup_layout()
end

vim.keymap.set("n", "<leader>a", function()
	M.toggle()
end)

return M
