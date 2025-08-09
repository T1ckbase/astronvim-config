---@type LazySpec
return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    -- ensure_installed = {
    --   "lua",
    --   "vim",
    --   -- add more arguments for adding more treesitter parsers
    -- },
    highlight = {
      additional_vim_regex_highlighting = false,
    },
  },
}
