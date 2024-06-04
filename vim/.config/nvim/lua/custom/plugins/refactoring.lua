return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup {
        show_success_message = true,
      }

      vim.keymap.set({ 'n', 'x' }, '<leader>rp', function()
        require('telescope').extensions.refactoring.refactors()
      end, { desc = 'Refactor' })
    end,
  },
}
