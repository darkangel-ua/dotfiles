local Path = require('plenary.path')
local scandir = require('plenary.scandir')
local action_state = require("telescope.actions.state")
local action_utils = require('telescope.actions.utils')
local actions = require('telescope.actions')
local conf = require("telescope.config").values
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local scheduler = require("plenary.async.util").scheduler
local utils = require("telescope.utils")

local selected_targets = {}

local function in_selected_targers(v)
    for _, t in ipairs(selected_targets) do
        if t == v then
            return true
        end
    end

    return false
end

local function display_prefix(v)
    if in_selected_targers(v) then
        return " ● "
    else
        return "   "
    end
end

local M = {}

local function get_reply_dir()
    return Path.new(vim.api.nvim_eval('cmake#buildsys#Get().GetPathToCurrentConfig()')) / '.cmake' / 'api' / 'v1' / 'reply'
end

local function get_codemodel_targets()
    local found_files = scandir.scan_dir(get_reply_dir().filename, { search_pattern = 'codemodel*' })
    if #found_files == 0 then
        vim.notify('Unable to find codemodel file', vim.log.levels.ERROR)
        return {}
    end
    local codemodel = Path:new(found_files[1])
    local codemodel_json = vim.json.decode(codemodel:read())
    return codemodel_json['configurations'][1]['targets']
end

local function get_target_info(codemodel_target)
  return vim.json.decode((get_reply_dir() / codemodel_target['jsonFile']):read())
end

local function get_targets_from_cmake()
    local model_targets = get_codemodel_targets()

    local targets = {}
    if #model_targets > 1 then
        targets = { 'all' }
    end

    for _, t in ipairs(get_codemodel_targets()) do
        table.insert(targets, t.name)
    end

    return targets
end

M.select_build_targets = function(opts)
    vim.cmd [[ Lazy load vim-cmake ]]
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Select CMake targets",
        results_title = "Available targets",
        finder = finders.new_table {
            results = get_targets_from_cmake(),
            entry_maker = function(result)
                return {
                    value = result,
                    display = display_prefix(result) .. result,
                    ordinal = result,
                    valid = true
                }
            end
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            local picker = action_state.get_current_picker(prompt_bufnr)

            actions.select_default:replace(function()
                selected_targets = {}
                local targets = { "--target" }
                local selection = action_state.get_selected_entry()
                local mselection = picker:get_multi_selection()
                if #mselection > 1 then
                    for _, v in ipairs(mselection) do
                        table.insert(selected_targets, v.value)
                    end
                else
                    table.insert(selected_targets, selection.value)
                end

                for _, v in ipairs(selected_targets) do
                    table.insert(targets, v)
                end

                vim.g.cmake_build_options = targets
                require("notify")("default action is: " .. vim.inspect(targets))

                actions.close(prompt_bufnr)
            end)

            return true
        end
    }):find()
end

M.get_selected_target_executable_path = function()
    if #selected_targets == 0 then
        require('notify').notify('You must select some targets to build beforehand',
                                 vim.log.levels.ERROR,
                                 { title = 'dap' })
        return require('dap').ABORT
    end

    return vim.api.nvim_eval('cmake#buildsys#Get().GetPathToCurrentConfig()') .. '/' .. selected_targets[1]
end

return M
