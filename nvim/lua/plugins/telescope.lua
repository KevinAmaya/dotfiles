return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5", -- Or "latest"
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required dependency
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
				},
			},
		})
	end,
}
