return {
  -- NOTE: Yes, you can install new plugins here!
  "mfussenegger/nvim-dap",
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    "rcarriga/nvim-dap-ui",
    -- Installs the debug adapters for you
    "jay-babu/mason-nvim-dap.nvim",
    -- Add your own debuggers here
    -- "leoluz/nvim-dap-go",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("mason-nvim-dap").setup({
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,
      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},
      -- Update this to ensure that you have the debuggers for the langs you want
      ensure_installed = {
        "bash",
        "cppdbg",
        "python",
      },
    })
    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    dapui.setup({
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })
    KeymapSet({
      {
        mod = "n",
        lhs = "<F6>",
        rhs = dap.continue,
        opt = {
          desc = "Debug: Start/Continue",
        }
      },
      {
        mod = "n",
        lhs = "<F7>",
        rhs = dap.step_into,
        opt = {
          desc = "Debug: Step Into",
        }
      },
      {
        mod = "n",
        lhs = "<F8>",
        rhs = dap.step_over,
        opt = {
          desc = "Debug: Step Over",
        }
      },
      {
        mod = "n",
        lhs = "<F9>",
        rhs = dap.step_out,
        opt = {
          desc = "Debug: Step Out",
        }
      },
      {
        mod = "n",
        lhs = "<leader>b",
        rhs = dap.toggle_breakpoint,
        opt = {
          desc = "Debug: Toggle Breakpoint",
        }
      },
      {
        mod = "n",
        lhs = "<leader>B",
        rhs = function()
          dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end,
        opt = {
          desc = "Debug: Set Breakpoint",
        }
      },
      {
        mod = "n",
        lhs = "<F10>",
        rhs = dapui.toggle,
        opt = {
          desc = "Debug: See last session result.",
        }
      },
    })
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
    -- Install golang specific config
    -- require("dap-go").setup({})
  end,
}
