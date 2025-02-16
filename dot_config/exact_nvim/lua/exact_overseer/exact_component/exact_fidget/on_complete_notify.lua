return {
    desc = "Fidget task complete status notification",
    constructor = function(params)
        local constants = require("overseer.constants")
        local statuses = constants.STATUS
        local notify = require('fidget.notification').notify

        return {
            on_complete = function(self, task, status, result)
                if status == statuses.FAILURE then
                    notify("Failed - " .. task.name, vim.log.levels.ERROR)
                elseif status == statuses.CANCELED then
                    notify("Cancelled - " .. task.name, vim.log.levels.WARN)
                end
            end,
        }
    end,
}
