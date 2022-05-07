local cmp = require('cmp')
local mapping = require('cmp.config.mapping')
local types = require('cmp.types')
local snip = require('luasnip')

local icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

local function select_or_choice_impl(direction, fallback)
    if cmp.visible() then
        if direction == 1 then
            cmp.select_next_item()
        else
            cmp.select_prev_item()
        end
    elseif snip.choice_active() then
        snip.change_choice(direction)
    else
        fallback()
    end
end

local function select_or_choice(direction)
    return function(fallback) select_or_choice_impl(direction, fallback) end
end

cmp.setup({
    snippet = {
      expand = function(args)
        snip.lsp_expand(args.body)
      end
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Down>'] = mapping({
          i = mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
          c = function(fallback)
              cmp.close()
              vim.schedule(cmp.suspend())
              fallback()
          end,
      }),
      ['<Up>'] = mapping({
          i = mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
          c = function(fallback)
              cmp.close()
              vim.schedule(cmp.suspend())
              fallback()
          end,
      }),
      -- snippets works only on Tabs
      ["<Tab>"] = cmp.mapping(function(fallback)
          if snip.expand_or_jumpable() then
              snip.expand_or_jump()
          else
              select_or_choice_impl(1, fallback)
          end
      end, { "i", "s", "c"}),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
          if snip.jumpable(-1) then
              snip.jump(-1)
          else
              select_or_choice_impl(-1, fallback)
          end
      end, { "i", "s", "c"}),
      -- use Ctrl-k and Ctrl-k for Up and Down and for snippet choice selection
      ["<C-j>"] = cmp.mapping({
        i = select_or_choice(1),
        s = select_or_choice(1),
        c = cmp.mapping.select_next_item()
      }),
      ["<C-k>"] = cmp.mapping({
        i = select_or_choice(-1),
        s = select_or_choice(-1),
        c = cmp.mapping.select_prev_item()
      }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'spell' },
        { name = 'luasnip' },
        { name = 'calc' },
        { name = 'path' }
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = icons[vim_item.kind]

            return vim_item
        end,
    },
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

require('nvim-autopairs').setup()

-- this is some magic I copy-paste from nvim-autopairs front page
-- you need setup cmp first put this after cmp.setup()
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

