vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.virtualedit = "block"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff  = 999
vim.opt.inccommand  = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[ %s/\s\+$//e ]])
  end,
})
