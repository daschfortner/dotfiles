# LSP Configurations

## Overview

When you move around across random environments (especially if you ever have to
run in internet-disconnected environments) using the fancy Mason/LSP config
setup can get cumbersome. This folder follows the
[excellent guide here](https://dx13.co.uk/articles/2023/04/24/neovim-lsp-without-plugins/)
to use the built-in LSP functionality in Neovim to set up various language
servers.

## LSP configuration overview

Since this is not using the `mason` plugin, and the `lsp-config` shortcuts,
you need to ensure the proper software is installed and lsp properly configured.
This is easier than it sounds.

Many language servers are readily available nowadays (see for instance
[typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)
or [terraform-ls](https://github.com/hashicorp/terraform-ls)). These servers
can be installed manually before executing Neovim. The various lua files in this
directory contain documentation for which language servers need to be installed
to run.

Once the correct language server is installed, you can just fill in the following
template (many thanks to again to Mike Rhodes 
[here](https://dx13.co.uk/articles/2023/04/24/neovim-lsp-without-plugins/#automating-creating-and-attaching-clients)):

```lua
local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = {'<insert file type patterns here>'},
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ '<file representing root dir>' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = '<language server name>',
            cmd = { '<lanuage server command>' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})
```

For example, here's the following configuration for Typescript:

```lua
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
```

There isn't much more to it. 
