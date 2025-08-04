
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      -- Core
      "bash", "c", "cpp", "lua", "vim", "vimdoc", "query",
      -- Web
      "html", "htmldjango", "css", "scss", "javascript",
      "typescript", "tsx", "json", "markdown", "markdown_inline",
    },

    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent    = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection    = "<leader>ss",
        node_incremental  = "<leader>si",
        scope_incremental = "<leader>sc",
        node_decremental  = "<leader>sd",
      },
    },

    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["ib"] = "@block.inner",
          ["ob"] = "@block.outer",
          ["if"] = "@function.inner",
          ["ic"] = "@class.inner",
          ["ii"] = "@conditional.inner",
          ["oi"] = "@conditional.outer",
          ["fp"] = "@call.inner",
        },
        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@function.outer']  = 'V',
          ['@class.outer']     = '<c-v>',
        },
        include_surrounding_whitespace = true,
      },
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
