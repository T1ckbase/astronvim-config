---@type LazySpec
return {
  'AstroNvim/astrolsp',
  ---@type AstroLSPOpts
  opts = {
    defaults = {
      hover = {
        border = 'solid',
      },
      signature_help = {
        border = 'solid',
      },
    },
    formatting = {
      -- format_on_save = false,
    },
    ---@diagnostic disable: missing-fields
    config = {
      denols = {
        settings = {
          deno = {
            suggest = {
              imports = {
                hosts = {
                  ['https://crux.land'] = false,
                  ['https://deno.land'] = false,
                  ['https://x.nest.land'] = false,
                },
              },
            },
          },
        },
      },
    },
    mappings = {
      n = {
        ['g.'] = {
          function() vim.lsp.buf.code_action() end,
          desc = 'LSP code action',
          cond = 'textDocument/codeAction',
        },
        ['<Leader>la'] = nil,
        ['<Leader>La'] = nil,
      },
    },
  },
}
