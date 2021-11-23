local ls = require("luasnip")
local types = require("luasnip.util.types")

-- we need to apply our colors before setup
require('settings.colors').apply()

ls.config.setup({
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = {{"🅒 ", "GruvboxOrange"}}
            }
        },
    },
    ext_base_prio = 200,
    ext_prio_increase = 3,
})

local cpp_main = [[
int main(int argc, const char* argv[]) {
    $0
    return 0;
}
]]

local cpp_class = [[
class $1 {
public:
    $0
};
]]

ls.snippets.cpp = {
    ls.parser.parse_snippet({trig = "main"}, cpp_main),
    ls.parser.parse_snippet({trig = "class"}, cpp_class),
}

-- load local snippets configuration
pcall(require, "settings.snippets_local")
