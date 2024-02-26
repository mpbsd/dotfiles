return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    local mason_nvim_dap = require('mason-nvim-dap')
    local globals = require('mpbsd.core.opts.globals')
    mason_nvim_dap.setup({
      automatic_setup = true,
      handlers = {},
      ensure_installed = globals.adapters,
    })
    dapui.setup({
      -- ui settings {{{
      controls = {
        element = 'repl',
        enabled = true,
        icons = {
          disconnect = '',
          pause = '',
          play = '',
          run_last = '',
          step_back = '',
          step_into = '',
          step_out = '',
          step_over = '',
          terminate = ''
        }
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = 'single',
        mappings = {
          close = { 'q', '<esc>' }
        }
      },
      force_buffers = true,
      icons = {
        collapsed = '',
        current_frame = '',
        expanded = ''
      },
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.25
            },
            {
              id = 'breakpoints',
              size = 0.25
            },
            {
              id = 'stacks',
              size = 0.25
            },
            {
              id = 'watches',
              size = 0.25
            }
          },
          position = 'left',
          size = 40
        },
        {
          elements = {
            {
              id = 'repl',
              size = 0.5
            },
            {
              id = 'console',
              size = 0.5
            }
          },
          position = 'bottom',
          size = 10
        }
      },
      mappings = {
        edit = 'e',
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        repl = 'r',
        toggle = 't'
      },
      render = {
        indent = 1,
        max_value_lines = 100
      }
      -- }}}
    })
    globals.nvim_set_keymaps({
      -- keymaps {{{
      {
        mod = 'n',
        lhs = '<F6>',
        rhs = dap.continue,
        opt = {
          desc = 'Start/Continue',
        }
      },
      {
        mod = 'n',
        lhs = '<F7>',
        rhs = dap.step_into,
        opt = {
          desc = 'Step Into',
        }
      },
      {
        mod = 'n',
        lhs = '<F8>',
        rhs = dap.step_over,
        opt = {
          desc = 'Step Over',
        }
      },
      {
        mod = 'n',
        lhs = '<F9>',
        rhs = dap.step_out,
        opt = {
          desc = 'Step Out',
        }
      },
      {
        mod = 'n',
        lhs = '<F10>',
        rhs = dapui.toggle,
        opt = {
          desc = 'See last session result.',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>b',
        rhs = dap.toggle_breakpoint,
        opt = {
          desc = 'Toggle Breakpoint',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>B',
        rhs = function()
          dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        opt = {
          desc = 'Set Breakpoint',
        }
      },
      -- }}}
    })
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end
}
