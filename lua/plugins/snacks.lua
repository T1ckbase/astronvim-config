---@type LazySpec
return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      preset = {
        header = 'NEOVIM',
      },
      sections = {
        { section = 'header', padding = 2, indent = 0, align = 'center' },
        { section = 'keys', gap = 1, padding = 2 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    -- input = { enabled = false },
  },
}
