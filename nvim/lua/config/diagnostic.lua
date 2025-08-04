vim.diagnostic.config({
    virtual_text = {
        prefix = ' ',
        severity = { min = vim.diagnostic.severity.HINT } 
    },
    signs = true,
    update_in_insert = false, -- Don't update diagnostics in insert mode
})

