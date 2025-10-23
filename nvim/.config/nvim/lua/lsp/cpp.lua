--  C/C++ language server
--  
--  This LSP configuration uses `clangd`:
--    apt install clangd

local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = { 'cpp', 'hpp', 'c' },
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ 'CMakeLists', '*.cpp' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = 'clangd',
            cmd = { 'clangd' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})

