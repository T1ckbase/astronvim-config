---@type LazySpec
return {
  'AstroNvim/astrocore',
  ---@type AstroCoreOpts
  opts = {
    diagnostics = {
      virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR },
      },
      virtual_lines = false, -- Neovim v0.11+ only
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        border = 'solid',
      },
    },
    options = {
      opt = {
        -- cmdheight = 1,
        fileformat = 'unix',
        fileformats = { 'unix', 'dos' },
        scrolloff = 4,
        sidescrolloff = 8,
        winborder = 'solid',
        wrap = false,
      },
    },
    autocmds = {
      foo = {
        {
          event = 'FileType',
          pattern = '*',
          callback = function() vim.opt_local.formatoptions:remove({ 'r', 'o' }) end,
        },
        -- {
        --   event = 'ModeChanged',
        --   pattern = '*',
        --   callback = function()
        --     if vim.api.nvim_get_mode().mode == 'i' then
        --       vim.diagnostic.config({ virtual_text = false })
        --     else
        --       vim.diagnostic.config({
        --         virtual_text = {
        --           severity = { min = vim.diagnostic.severity.ERROR },
        --         },
        --       })
        --     end
        --   end,
        -- },
      },
    },
  },
}
