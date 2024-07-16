return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
      'mxsdev/nvim-dap-vscode-js',
      {
        'microsoft/vscode-js-debug',
        build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
      },
    },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()
      require('nvim-dap-virtual-text').setup()
      require('dap-vscode-js').setup {
        debugger_path = vim.fn.expand '$HOME/.local/share/nvim/lazy/vscode-js-debug',
        adapters = { 'pwa-node' },
      }

      dap.configurations.typescript = {
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Auto Attach',
          cwd = vim.fn.getcwd(),
        },
      }

      -- Eval var under cursor
      vim.keymap.set('n', '<leader>?', function()
        require('dapui').eval(nil, { enter = true })
      end)
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>gb', dap.run_to_cursor)
      vim.keymap.set('n', '<F5>', dap.step_out)
      vim.keymap.set('n', '<F6>', dap.step_back)
      vim.keymap.set('n', '<F7>', dap.step_into)
      vim.keymap.set('n', '<F8>', dap.step_over)
      vim.keymap.set('n', '<F9>', dap.continue)
      vim.keymap.set('n', '<F10>', dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
