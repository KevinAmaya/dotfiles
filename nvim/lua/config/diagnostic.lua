vim.diagnostic.config({
    virtual_text = {
        prefix = ' ', -- Optional: customize the prefix before the message
        severity = { min = vim.diagnostic.severity.HINT } -- Display all severities from HINT upwards
    },
    signs = true,
    update_in_insert = false, -- Don't update diagnostics in insert mode
})

