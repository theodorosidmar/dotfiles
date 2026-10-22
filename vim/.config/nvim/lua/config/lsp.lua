vim.lsp.enable {
  'lua_ls',
  'ts_ls',
  'kotlin_lsp',
  'copilot',
}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local bufnr = event.buf

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', function()
      vim.lsp.buf.hover { border = 'rounded' }
    end, 'Hover Documentation')

    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    -- Highlight references of the word under the cursor
    if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup('LspHighlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = bufnr,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = bufnr,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(args)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'LspHighlight', buffer = args.buf }
        end,
      })
    end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion) then
      vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
      map('<C-y>', vim.lsp.inline_completion.get, 'accept inline completion', 'i')
      map('<C-g>', vim.lsp.inline_completion.select, 'switch inline completion', 'i')
    end
  end,
})
