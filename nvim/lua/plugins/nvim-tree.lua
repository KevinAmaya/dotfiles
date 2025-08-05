return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
			},
			actions = {
				open_file = {
					quit_on_open = true, -- auto close tree when a file is opened
				},
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
						folder_arrow = true,
					},
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
		})

		-- Keymap: <leader>e to toggle nvim-tree
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
	end,
}
