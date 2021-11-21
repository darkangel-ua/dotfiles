local cmp = require('cmp')
local snip = require('luasnip')
local lspkind = require('lspkind')

lspkind.init()

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
      expand = function(args)
        snip.lsp_expand(args.body)
      end
    },
    mapping = {
        ['<Up>'] = cmp.mapping({
        c = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              cmp.complete()
            end
        end
       }), 
        ['<Down>'] = cmp.mapping({
        c = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              cmp.complete()
            end
        end
       }), 
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
      -- use Alt-k and Alt-k for snippet choice selection
      ["<A-j>"] = cmp.mapping(function(fallback)
          if snip.choice_active() then
              snip.change_choice(-1)
          else
              fallback()
          end
      end, { "i", "s" }),
      ["<A-k>"] = cmp.mapping(function(fallback)
          if snip.choice_active() then
              snip.change_choice()
          else
              fallback()
          end
      end, { "i", "s" }),
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

