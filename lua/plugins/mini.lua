---@type LazySpec
return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.ai').setup({
      mappings = {
        around_next = '',
        inside_next = '',
        around_last = '',
        inside_last = '',
        goto_left = '',
        goto_right = '',
      },
      silent = true,
    })

    require('mini.comment').setup({
      mappings = {
        textobject = 'igc',
      },
    })
  end,
}
