-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- You can disable default plugins as follows:
  { 'akinsho/toggleterm.nvim', enabled = false },
  { 'folke/todo-comments.nvim', enabled = false },

  -- -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   'L3MON4D3/LuaSnip',
  --   config = function(plugin, opts)
  --     require('astronvim.plugins.configs.luasnip')(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require('luasnip')
  --     luasnip.filetype_extend('javascript', { 'javascriptreact' })
  --   end,
  -- },

  -- {
  --   'windwp/nvim-autopairs',
  --   config = function(plugin, opts)
  --     require('astronvim.plugins.configs.nvim-autopairs')(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require('nvim-autopairs')
  --     local Rule = require('nvim-autopairs.rule')
  --     local cond = require('nvim-autopairs.conds')
  --     npairs.add_rules(
  --       {
  --         Rule('$', '$', { 'tex', 'latex' })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex('%%'))
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex('xxx', 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex('xx'))
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule('a', 'a', '-vim')
  --     )
  --   end,
  -- },

  -- {
  --   'kvrohit/mellow.nvim',
  --   lazy = true,
  --   name = 'mellow',
  --   config = function()
  --     -- https://github.com/mellow-theme/mellow.nvim/blob/main/lua/lualine/themes/mellow.lua#L1
  --     local c = require('mellow.colors').dark
  --     -- vim.api.nvim_set_hl(0, "SnacksIndentChunk", { fg = "#000000" })
  --     vim.g.mellow_highlight_overrides = {
  --       ['TabLineFill'] = { bg = '#000000' },
  --       ['NormalFloat'] = { fg = c.white, bg = c.gray01 },
  --       ['FloatBorder'] = { fg = c.gray03, bg = c.gray01 },
  --       ['DiagnosticError'] = { fg = '#e45454' },
  --       ['DiagnosticWarn'] = { fg = '#ff942f' },
  --       ['DiagnosticInfo'] = { fg = '#00b7e4' },
  --       ['DiagnosticHint'] = { fg = '#2faf64' },
  --       ['DiagnosticUnderlineError'] = { underline = false, undercurl = true, sp = '#e45454' },
  --       ['DiagnosticUnderlineWarn'] = { underline = false, undercurl = true, sp = '#ff942f' },
  --       ['DiagnosticUnderlineInfo'] = { underline = false, undercurl = true, sp = '#00b7e4' },
  --       ['DiagnosticUnderlineHint'] = { underline = false, undercurl = true, sp = '#2faf64' },
  --       ['DiagnosticUnnecessary'] = { fg = nil },
  --       ['SnacksIndent'] = { fg = c.gray02 },
  --       ['SnacksIndentScope'] = { fg = c.gray04 },
  --     }
  --   end,
  -- },

  -- {
  --   'webhooked/kanso.nvim',
  --   lazy = false,
  --   priority = 1000,
  -- },

  -- { 'kamwitsta/vinyl.nvim' },
}
