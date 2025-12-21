local M = {}

local outline = require('outline')

local
function get_win_by_filetype(tabpage, ft)
    local wins = vim.api.nvim_tabpage_list_wins(tabpage)
    for _, w in ipairs(wins) do
        if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(w), 'filetype') == ft then
            return w
        end
    end

    return nil
end

function M.on_esc_pressed()
    local trouble_win = get_win_by_filetype(0, 'trouble')
    local cmake_win = get_win_by_filetype(0, 'vimcmake')

    if trouble_win then
        require('trouble').close()
    end

    if cmake_win then
        vim.cmd(':CMakeClose')
    end

    if outline.is_open() then
        outline.close()
    end
end

function M.cmake_open()
    vim.cmd(':CMakeOpen')
    local cmake_win = get_win_by_filetype(0, 'vimcmake')
    if cmake_win then
        vim.api.nvim_set_current_win(cmake_win)
    end
end

function M.bufdelete()
    local trouble_win = get_win_by_filetype(0, 'trouble')
    local cmake_win = get_win_by_filetype(0, 'vimcmake')

    if trouble_win or cmake_win then
        require('bufdelete').bufdelete(0, true)
    else
        require('bufdelete').bufdelete(0, false)
    end

end

return M
