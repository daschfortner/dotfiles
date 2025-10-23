--  Python language server
--  
--  This LSP configuration uses `pylsp`:
--    pipx install python-lsp-server

local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = { 'python' },
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ 'pyproject.toml', 'setup.py', '.git' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = 'python-lsp-server',
            cmd = { 'pylsp' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})


