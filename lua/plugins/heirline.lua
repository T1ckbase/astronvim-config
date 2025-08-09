---@type LazySpec
return {
  'rebelot/heirline.nvim',
  opts = function(_, opts)
    local status = require('astroui.status')
    opts.statusline = { -- statusline
      hl = { fg = 'fg', bg = 'bg' },
      status.component.mode({
        mode_text = { padding = { left = 1, right = 1 } },
      }), -- add the mode text
      status.component.git_branch(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.builder({
        provider = function()
          local line = vim.api.nvim_win_get_cursor(0)[1] - 1
          local diags = vim.diagnostic.get(0, { lnum = line })
          if #diags == 0 then return '' end

          local error_msg = ''
          for _, diag in ipairs(diags) do
            if diag.severity == vim.diagnostic.severity.ERROR then
              error_msg = diag.message
              break -- Found the first error, exit loop
            end
          end

          if #error_msg > 50 then
            return error_msg:sub(1, 50) .. '...'
          else
            return error_msg
          end
        end,
        condition = function(bufnr)
          return require('astroui.status.condition').has_diagnostics(bufnr) and vim.api.nvim_get_mode().mode == 'i'
        end,
        hl = { fg = 'diag_ERROR' },
      }),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      -- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md#filetype-fileencoding-and-fileformat
      status.component.builder({
        provider = function()
          local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
          return enc:upper()
        end,
        padding = { left = 1, right = 1 },
        condition = require('astroui.status.condition').is_file,
      }),
      status.component.builder({
        provider = function()
          local fileformat = vim.bo.fileformat
          if fileformat == 'unix' then
            return 'LF'
          elseif fileformat == 'dos' then
            return 'CRLF'
          elseif fileformat == 'mac' then
            return 'CR'
          else
            return '???'
          end
        end,
        padding = { left = 1, right = 1 },
        condition = require('astroui.status.condition').is_file,
      }),
      status.component.file_info(),
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      status.component.nav(),
      -- remove the 2nd mode indicator on the right
    }
  end,
}
