local autocmd = vim.api.nvim_create_autocmd

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettierd
    },
    on_attach = function(client, bufnr)
        autocmd({ "BufWritePre" }, { callback = function() vim.lsp.buf.formatting_sync() end, pattern = "*.tsx,*.ts,*.jsx,*.js" })
    end
})
