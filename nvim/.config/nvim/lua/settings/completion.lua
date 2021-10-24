local cmp = require('cmp')
local snip = require('luasnip')
local lspkind = require('lspkind')

lspkind.init()

cmp.setup({
    snippet = {
      expand = function(args)
        snip.lsp_expand(args.body)
      end
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'calc' },
        { name = 'path' }
    },
    formatting = {
        format = function(entry, vim_item)
          -- fancy icons and a name of kind
          vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

          -- set a name for each source
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
          })[entry.source.name]
          return vim_item
        end,
  }
})

require('nvim-autopairs').setup()

-- this is some magic I copy-paste from nvim-autopairs front page
-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})

