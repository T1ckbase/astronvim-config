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

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          -- header = table.concat({
          --   "███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
          --   "████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
          --   "██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
          --   "██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
          --   "██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
          --   "╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
          -- }, "\n"),
          header = [[
                 =/;;/-
                +:    //
               /;      /;
              -X        H.
.//;;;:;;-,   X=        :+   .-;:=;:;%;.
M-       ,=;;;#:,      ,:#;;:=,       ,@
:%           :%.=/++++/=.$=           %=
 ,%;         %/:+/;,,/++:+/         ;+.
   ,+/.    ,;@+,        ,%H;,    ,/+,
      ;+;;/= @.  .H##X   -X :///+;
      ;+=;;;.@,  .XM@$.  =X.//;=%/.
   ,;:      :@%=        =$H:     .+%-
 ,%=         %;-///==///-//         =%,
;+           :%-;;;;;;;;-X-           +:
@-      .-;;;;M-        =M/;;;-.      -X
 :;;::;;-.    %-        :+    ,-;;-;:==
              ,X        H.
               ;/      %=
                //    +;
                 ,////,]],
        },
        sections = {
          { section = "header", padding = 2, indent = 10, align = "left" },
          -- {
          --   section = "terminal",
          --   cmd = "curl -s https://gist.githubusercontent.com/T1ckbase/389487516f92b3429916bde6559094b7/raw/p2r3",
          --   height = 16,
          --   -- width = 32,
          --   padding = 1,
          --   indent = 16,
          -- },
          { section = "keys", gap = 1, padding = 2 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      timeout = 100,
      default_mappings = false,
      mappings = {
        i = {
          j = { k = "<Esc>" },
          k = { j = "<Esc>" },
        },
      },
    },
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode {
          mode_text = { padding = { left = 1, right = 1 } },
        }, -- add the mode text
        status.component.git_branch(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        -- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md#filetype-fileencoding-and-fileformat
        status.component.builder {
          provider = function()
            local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
            return enc:upper()
          end,
          padding = { left = 1, right = 1 },
          condition = require("astroui.status").condition.is_file,
        },
        status.component.builder {
          provider = function()
            local fileformat = vim.bo.fileformat
            if fileformat == "unix" then
              return "LF"
            elseif fileformat == "dos" then
              return "CRLF"
            elseif fileformat == "mac" then
              return "CR"
            else
              return "???"
            end
          end,
          padding = { left = 1, right = 1 },
          condition = require("astroui.status").condition.is_file,
        },
        status.component.file_info(),
        status.component.lsp(),
        status.component.virtual_env(),
        status.component.treesitter(),
        status.component.nav(),
        -- remove the 2nd mode indicator on the right
      }
    end,
  },

  {
    "kvrohit/mellow.nvim",
    lazy = true,
    name = "mellow",
    config = function()
      -- https://github.com/mellow-theme/mellow.nvim/blob/main/lua/lualine/themes/mellow.lua#L1
      local c = require("mellow.colors").dark
      -- vim.api.nvim_set_hl(0, "SnacksIndentChunk", { fg = "#000000" })
      vim.g.mellow_highlight_overrides = {
        ["TabLineFill"] = { bg = "#000000" },
        ["NormalFloat"] = { fg = c.white, bg = c.gray01 },
        ["FloatBorder"] = { fg = c.gray03, bg = c.gray01 },
        ["DiagnosticError"] = { fg = "#e45454" },
        ["DiagnosticWarn"] = { fg = "#ff942f" },
        ["DiagnosticInfo"] = { fg = "#00b7e4" },
        ["DiagnosticHint"] = { fg = "#2faf64" },
        ["DiagnosticUnderlineError"] = { underline = false, undercurl = true, sp = "#e45454" },
        ["DiagnosticUnderlineWarn"] = { underline = false, undercurl = true, sp = "#ff942f" },
        ["DiagnosticUnderlineInfo"] = { underline = false, undercurl = true, sp = "#00b7e4" },
        ["DiagnosticUnderlineHint"] = { underline = false, undercurl = true, sp = "#2faf64" },
        ["DiagnosticUnnecessary"] = { fg = nil },
        ["SnacksIndent"] = { fg = c.gray02 },
        ["SnacksIndentScope"] = { fg = c.gray04 },
      }
    end,
  },

  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      features = {
        -- toggle if diagnostics are enabled on startup
        diagnostics = true,
      },
      -- Configuration passed to `vim.diagnostic.config()`
      -- All available options can be found with `:h vim.diagnostic.Opts`
      diagnostics = {
        virtual_text = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        virtual_lines = false, -- Neovim v0.11+ only
        update_in_insert = true,
        underline = true,
        severity_sort = true,
      },
    },
  },

  {
    "brenoprata10/nvim-highlight-colors",
    event = { "User AstroFile", "InsertEnter" },
    cmd = "HighlightColors",
    -- specs = {
    --   "AstroNvim/astrocore",
    --   opts = function(_, opts)
    --     local maps = opts.mappings
    --     maps.n["<Leader>uz"] = { function() vim.cmd.HighlightColors "Toggle" end, desc = "Toggle color highlight" }
    --   end,
    -- },
    opts = {
      enable_named_colors = false,
      virtual_symbol = "󱓻",
      render = "virtual",
      virtual_symbol_position = "inline",
      exclude_buffer = function(bufnr)
        local buf_utils = require "astrocore.buffer"
        return buf_utils.is_large(bufnr) or not buf_utils.is_valid(bufnr)
      end,
    },
  },
}
