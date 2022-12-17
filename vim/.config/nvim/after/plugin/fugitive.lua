vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

--local autocmd = vim.api.nvim_create_autocmd
--local fugitive_group = vim.api.nvim_create_augroup('fugitive', {})

--autocmd('BufWinEnter', {
    --group = fugitive_group,
    --pattern = '*',
    --callback = function()
        --if vim.bo.ft ~= 'fugitive' then
            --return
        --end

        --local bufnr = vim.api.nvim_get_current_buf()
        --local opts = {buffer = bufnr, remap = false}

        --vim.keymap.set('n', '<leader>p', vim.cmd.Git('push'), opts)
        --vim.keymap.set('n', '<leader>gcan', vim.cmd.Git('commit -a --amend --no-edit'), opts)
        --vim.keymap.set('n', '<leader>gpf', vim.cmd.Git('push --force'), opts)
    --end,
--})
