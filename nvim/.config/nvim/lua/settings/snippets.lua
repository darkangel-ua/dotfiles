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
    -- gtest
    ls.parser.parse_snippet({trig = "test"}, "GTEST_TEST(${1:test-suit-name}, ${2:test-name}) {\n\t$0\n}"),
    ls.parser.parse_snippet({trig = "testf"}, "TEST_F(${1:test-fixture}, ${2:test-name}) {\n\t$0\n}"),
    ls.parser.parse_snippet({trig = "etrue"}, "EXPECT_TRUE(${1:condition});$0"),
    ls.parser.parse_snippet({trig = "efalse"}, "EXPECT_FALSE(${1:condition});$0"),
    ls.parser.parse_snippet({trig = "eeq"}, "EXPECT_EQ(${1:expected}, ${2:actual});$0"),
    ls.parser.parse_snippet({trig = "ene"}, "EXPECT_NE(${1:val1}, ${2:val2});$0"),
    ls.parser.parse_snippet({trig = "enothrow"}, "EXPECT_NO_THROW(${1:expression});$0"),
    ls.parser.parse_snippet({trig = "eanythrow"}, "EXPECT_ANY_THROW(${1:expression});$0"),
    ls.parser.parse_snippet({trig = "ethrow"}, "EXPECT_THROW(${1:expression}, ${2:expected-exception});$0"),
    ls.parser.parse_snippet({trig = "ex"}, "EXPECT"), -- this helps discover other macroses
}

-- load local snippets configuration
pcall(require, "settings.snippets_local")
