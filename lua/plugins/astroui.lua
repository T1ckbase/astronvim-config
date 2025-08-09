-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  'AstroNvim/astroui',
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = 'vscode', -- astrodark
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
      vscode = {
        DiagnosticError = { fg = '#e45454' },
        DiagnosticWarn = { fg = '#ff942f' },
        DiagnosticInfo = { fg = '#00b7e4' },
        DiagnosticHint = { fg = '#2faf64' },
        DiagnosticUnderlineError = { underline = false, undercurl = true, sp = '#e45454' },
        DiagnosticUnderlineWarn = { underline = false, undercurl = true, sp = '#ff942f' },
        DiagnosticUnderlineInfo = { underline = false, undercurl = true, sp = '#00b7e4' },
        DiagnosticUnderlineHint = { underline = false, undercurl = true, sp = '#2faf64' },
        DiagnosticUnnecessary = { fg = nil },
        NormalFloat = { bg = '#2a2a2a' },
        FloatBorder = { fg = '#484848', bg = '#2a2a2a' },
        SnacksPickerBorder = { fg = '#484848' },
        TabLineFill = { bg = '#000000' },
        StatusLine = { bg = '#181818' },
        NeoTreeIndentMarker = { fg = '#484848' },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = '⠋',
      LSPLoading2 = '⠙',
      LSPLoading3 = '⠹',
      LSPLoading4 = '⠸',
      LSPLoading5 = '⠼',
      LSPLoading6 = '⠴',
      LSPLoading7 = '⠦',
      LSPLoading8 = '⠧',
      LSPLoading9 = '⠇',
      LSPLoading10 = '⠏',
      -- LSPLoading1 = "",
      -- LSPLoading2 = "",
      -- LSPLoading3 = "",
      -- LSPLoading4 = "",
      -- LSPLoading5 = "",
      -- LSPLoading6 = "",
      ActiveTS = '',
    },
    status = {
      attributes = {
        mode = { bold = true },
      },
      separators = {
        breadcrumbs = ' ',
        path = ' ',
      },
      colors = {
        buffer_fg = '#777777',
        buffer_close_fg = '#777777',
        buffer_active_close_fg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = 'Normal' }).fg),
      },
    },
  },
}
