local dap = require('dap')

dap.adapters.cpp = {
  id = "cppdbg",
  type = 'executable',
  command = vim.fn.stdpath("data") .. '/mason/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cpp",
    request = "launch",
    program = function()
      return require('settings.plugins.cmake').get_selected_target_executable_path()
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
