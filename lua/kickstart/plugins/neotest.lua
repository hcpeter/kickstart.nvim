return {
  { 'nvim-neotest/nvim-nio' },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },
    config = function()
      local neotest = require 'neotest'
      neotest.setup {
        adapters = {
          require 'neotest-python' {
            -- Extra arguments for pytest
            args = { '--verbose' },
            -- Runner to use. Will use pytest by default
            runner = 'pytest',
          },
        },
      }

      -- Keymaps
      vim.keymap.set('n', '<leader>tt', function()
        neotest.run.run() -- Run nearest test
      end, { desc = 'Run neares[T] [T]est' })
      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand '%') -- Run current file
      end, { desc = 'Run curren[T] [F]ile' })
      vim.keymap.set('n', '<leader>ts', function()
        neotest.run.run { suite = true } -- Run all test files
      end, { desc = 'Run all [T]est file[S]' })
      vim.keymap.set('n', '<leader>to', function()
        neotest.output.open { enter = true } -- Open test output
      end, { desc = 'Open [T]est [O]utput' })
      vim.keymap.set('n', '<leader>tp', function()
        neotest.output_panel.toggle() -- Toggle output panel
      end, { desc = '[T]oggle output [P]anel' })
      vim.keymap.set('n', '<leader>tw', function()
        neotest.watch.toggle() -- Toggle watching test
      end, { desc = '[T]oggle [W]atching [P]anel' })
      vim.keymap.set('n', '<leader>tC', function()
        neotest.run.run { args = { '--cov' } }
      end, { desc = '[T]est All with [C]overage' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
