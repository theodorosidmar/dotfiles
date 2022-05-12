vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
lspkind.init()
local cmp = require 'cmp'

cmp.setup {
  mapping = {
    ["<c-u>"] = cmp.mapping.scroll_docs(-4),
    ["<c-d>"] = cmp.mapping.scroll_docs(4),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}

local function config(_config)
  return vim.tbl_deep_extend("force", {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

require'lspconfig'.tsserver.setup(config())
require'lspconfig'.kotlin_language_server.setup(config({
  cmd = { '/home/theodorosidmar/.kotlin/kotlin-language-server/server/build/install/server/bin/kotlin-language-server' }
}))
require'lspconfig'.gopls.setup(config())
