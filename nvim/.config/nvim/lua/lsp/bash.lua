--  bash language server
--  
--  This LSP configuration uses `bash-language-server`:
--    npm i -g bash-language-server
--
--  Note that this also will leverage shellcheck if installed:
--    apt install shellcheck

local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = { 'bash', 'sh' },
    callback = function()
        local client = vim.lsp.start({
            name = 'bash-language-server',
            cmd = { 'bash-language-server', 'start' },
            root_dir = '.',
        })
        vim.lsp.buf_attach_client(0, client)
    end
})
