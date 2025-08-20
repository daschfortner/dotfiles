--  Terraform language server
--  
--  This LSP configuration uses `terraform-ls`
--  The `terraform-ls` package is available through Hashicorp's apt repos, but
--  I find it easier to just download the binary and place it in your
--  /usr/local/bin. I try to avoid external debian sources.
--
--  Binaries can be downloaded here: https://releases.hashicorp.com/terraform-ls/

local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = { 'terraform', 'terraform-vars' },
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ '.terraform' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = 'terraform-ls',
            cmd = { 'terraform-ls', 'serve' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})
