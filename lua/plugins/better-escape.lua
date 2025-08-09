---@type LazySpec
return {
  'max397574/better-escape.nvim',
  event = 'VeryLazy',
  opts = {
    timeout = 100,
    default_mappings = false,
    mappings = {
      i = {
        j = { k = '<Esc>' },
        k = { j = '<Esc>' },
      },
    },
  },
}
