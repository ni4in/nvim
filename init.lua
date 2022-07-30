--[[ init.lua ]]



--LEADER KEYS Definition 
-- These key bindings need to be defined before the first \ is called otherwise it will defualt to \ 
vim.api.nvim_set_var('mapleader',',')
vim.api.nvim_set_var('localleader', '\\')

--loading global variables
local ok, error_message = pcall(require, "vars")
if ok then
	require("vars")
else
	print("error in vars loader :", error_message)

end
-- loading global options
local ok, error_message = pcall(require, "opts")
if ok then
	require("opts")
else
	print("error in opts loader: ", error_message)

end

-- loading plugins 
local ok,  error_message = pcall(require, "plugins")
if ok then
    require("plugins")
else
    print("error in plugin loader:", error_message )
end

local ok,  error_message  = pcall(require, "keys")
if ok then
    require("keys")
else
    print("error in keymap loader:", error_message )
end

local ok,  error_message = pcall(require, "nvim-tree")
if ok then
    require("nvim-tree").setup{}
else
    print("error in plugin loader:", error_message )
end

local ok,  error_message = pcall(require, "lualine")
if ok then
    require('lualine').setup{
    options = {
        theme = 'dracula-nvim'
    }
}
else
    print("error in plugin loader:", error_message )
end

local ok,  error_message = pcall(require, "nvim-autopairs")
if ok then
    require("nvim-autopairs").setup{}
else
    print("error in plugin loader:", error_message )
end

local ok,  error_message = pcall(require, "nvim-treesitter")
if ok then
    local configs = require("nvim-treesitter.configs")
    configs.setup{ensure_installed = {"c","lua","python","julia","go","rust","javascript","scala","latex","make","json", "markdown","yaml"}, highlight = {enable = true}, indent={enable = true}}
else
    print("error in plugin loader:", error_message )
end

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})







require("hop").setup{keys = 'etovxqpdygfblzhckisuran' }


local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
    capabilities = capabilities}

require('lspconfig')['clangd'].setup {
    capabilities = capabilities}

require('lspconfig')['sumneko_lua'].setup {capabilities = capabilities}


--require("which-key").setup{}
