local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ 'package.json' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = 'typescript-language-server',
            cmd = { 'typescript-language-server', '--stdio' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})

