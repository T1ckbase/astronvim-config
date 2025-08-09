---@type LazySpec
return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup({
      keymaps = {
        accept_suggestion = '<M-l>',
        clear_suggestion = '<C-]>',
        accept_word = '<M-h>',
      },
      color = {
        suggestion_color = '#6b6b6b',
        cterm = 244,
      },
      ignore_filetypes = { 'bigfile', 'snacks_input', 'snacks_notif' },
    })
  end,
}
