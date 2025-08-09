---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    default_component_configs = {
      container = {
        enable_character_fade = false,
      },
      indent = {
        indent_size = 1,
        padding = 0,
        indent_marker = '▏',
        last_indent_marker = '▏',
      },
      git_status = {
        symbols = {
          -- Change type
          added = 'A',
          modified = 'M',
          deleted = 'D',
          renamed = 'R',
          -- Status type
          untracked = 'U',
          ignored = 'I',
          unstaged = ' ',
          staged = 'S',
          conflict = 'C',
        },
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    follow_current_file = {
      leave_dirs_open = true,
    },
  },
}
