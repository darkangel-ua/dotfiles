return {
    desc = "Fidget progress spinner",
    constructor = function(params)
        local constants = require("overseer.constants")

        return {
            on_start = function(self, task)
                local progress = require('fidget.progress')
                self.handle = progress.handle.create({
                    title = task.name,
                    lsp_client = { name = 'overseer' },
                })
            end,
            on_complete = function(self, task, status, result)
                self.handle:finish()
            end,
        }
    end,
}
