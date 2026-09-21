return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'lewis6991/async.nvim',
    },
    config = function()
      require('refactoring').setup {
        show_success_message = true,
      }

      vim.keymap.set({ 'n', 'x' }, '<leader>rp', function()
        require('refactoring').select_refactor()
      end, { desc = 'Refactor' })
    end,
  },
}
