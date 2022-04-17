local cmp = require('cmp')
local mapping = require('cmp.config.mapping')
local types = require('cmp.types')
local snip = require('luasnip')
local lspkind = require('lspkind')

lspkind.init()

local function select_or_choice(direction)
    return function(fallback)
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
              fallback()
          end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
          if snip.jumpable(-1) then
              snip.jump(-1)
          else
              fallback()
          end
      end, { "i", "s" }),
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

