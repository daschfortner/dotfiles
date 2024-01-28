return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({buffer = bufnr})
      lsp_zero.buffer_autoformat()
      
      vim.keymap.set('n', '<leader>i', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {'tsserver', 'eslint', 'html', 'cssls'},
      handlers = {
        lsp_zero.default_setup,
      },
    })

    local cmp = require('cmp')

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({select = false}),
      })
    })

    cmp.setup({
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
    })
  end 
}
