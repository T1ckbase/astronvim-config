---@type LazySpec
return {
  'Saghen/blink.cmp',
  ---@type BlinkOpts
  opts = {
    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        'fallback',
      },
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        'snippet_forward',
        'fallback',
      },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    completion = {
      keymap = { preset = 'inherit' },
      list = { selection = { preselect = true, auto_insert = false } },
      menu = {
        border = 'none',
      },
      documentation = {
        window = {
          border = 'solid',
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    cmdline = {
      keymap = {
        ['<Tab>'] = { 'show', 'accept' },
      },
      completion = { menu = { auto_show = true } },
    },
    signature = {
      enabled = true,
      window = {
        border = 'solid',
      },
    },
  },
}
