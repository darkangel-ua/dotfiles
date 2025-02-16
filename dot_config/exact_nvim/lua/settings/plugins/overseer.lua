local M = {}

function M.setup()
    local overseer = require('overseer')

    overseer.setup({
        task_list = {
            bindings = {
                ["<up>"] = "PrevTask",
                ["<down>"] = "NextTask",
                ["dd"] = "<cmd>OverseerQuickAction dispose<cr>",
            },
        },
        component_aliases = {
           fidget = {
               { "display_duration", detail_level = 2 },
               "on_output_summarize",
               "on_exit_set_status",
               "fidget.on_complete_notify",
               "fidget.progress",
               "on_complete_dispose",
           },
        },
    })

    tags = require('overseer.constants').TAG
    tags["DEPLOY"] = "DEPLOY"

    -- configure private part
    local status, private_module = pcall(require, 'private.settings.plugins.overseer')
    if status then
        private_module.setup()
    end

    local keymap = function(mode, lhs, rhs, opts)
        if not opts then
            opts = {}
        end
        if opts.desc and opts.desc == '' then
            opts.desc = rhs
        end
        vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', { silent = true, noremap = true }, opts))
    end

    local last_build_task = nil
    function build_something()
        if not last_build_task or last_build_task:is_disposed() then
            overseer.run_template({tags = { tags.BUILD }, first = false, }, function(task)
                if task then
                    last_build_task = task
                end
            end)
        else
            last_build_task:restart(true)
        end
    end

    local last_deploy_task = nil
    function deploy_something()
        if not last_deploy_task or last_deploy_task:is_disposed() then
            overseer.run_template({tags = { tags.DEPLOY }, first = false, }, function(task)
                if task then
                    last_deploy_task = task
                end
            end)
        else
            last_deploy_task:restart(true)
        end
    end

    keymap('n', '<leader>w', '<cmd>OverseerOpen left<cr>')
    keymap('n', '<leader>W', '<cmd>OverseerRun<cr>')
    keymap('n', '<C-b><C-b>', build_something)
    keymap('n', '<C-b>b', function()
        last_build_task = nil
        build_something()
    end)
    keymap('n', '<C-b><C-d>', deploy_something)
    keymap('n', '<C-b>d', function()
        last_deploy_task = nil
        deploy_something()
    end)
end

return M
