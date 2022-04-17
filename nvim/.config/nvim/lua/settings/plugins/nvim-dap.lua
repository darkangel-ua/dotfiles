local dap = require('dap')

dap.adapters.cpp = {
  id = "cppdbg",
  type = 'executable',
  -- command = '/home/darkangel/.local/share/nvim/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  command = vim.fn.stdpath("data") .. '/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cpp",
    request = "launch",
    program = function()
      return vim.fn.getcwd() .. '/' .. ".build/Debug/simple"
    end,
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  -- {
  --   name = 'Attach to gdbserver :1234',
  --   type = 'cpp',
  --   request = 'launch',
  --   MIMode = 'gdb',
  --   miDebuggerServerAddress = 'localhost:1234',
  --   miDebuggerPath = '/usr/bin/gdb',
  --   cwd = '${workspaceFolder}',
  --   program = function()
  --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --   end,
  -- },
}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
