return {
    desc = "Show Trouble window when task falied",
    constructor = function(params)
        local trouble = require('trouble')
        local constants = require("overseer.constants")
        local statuses = constants.STATUS

        return {
            on_complete = function(self, task, status, result)
                if status == statuses.FAILURE then
                    trouble.open('quickfix')
                end
            end,
        }
    end,
}
