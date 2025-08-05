vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})

local function get_right_win()
	local current_win = vim.api.nvim_get_current_win()
	local right_win = nil
	local current_pos = vim.api.nvim_win_get_position(current_win)

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local pos = vim.api.nvim_win_get_position(win)
		if pos[1] == current_pos[1] and pos[2] > current_pos[2] then
			right_win = win
			break
		end
	end

	return right_win
end

-- Override Dirbuf file open action
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dirbuf",
	callback = function()
		vim.keymap.set("n", "<CR>", function()
			local filename = vim.fn.expand("<cfile>")
			local fullpath = vim.fn.fnamemodify(filename, ":p")
			local dirbuf_win = vim.api.nvim_get_current_win()

			-- Switch to right window if available
			local right_win = get_right_win()
			if right_win then
				vim.api.nvim_set_current_win(right_win)
			end

			-- Open the file
			vim.cmd("edit " .. vim.fn.fnameescape(fullpath))

			-- Close Dirbuf window safely if it's not the last one
			if vim.api.nvim_win_is_valid(dirbuf_win) and #vim.api.nvim_list_wins() > 1 then
				vim.api.nvim_win_close(dirbuf_win, true)
			end
		end, { buffer = true, desc = "Open file from Dirbuf and close it safely" })
	end,
})
