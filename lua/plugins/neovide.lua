if true then return {} end
if not vim.g.neovide then return {} end

vim.keymap.set(
  'n',
  '<F10>',
  function() vim.g.neovide_profiler = not vim.g.neovide_profiler end,
  { desc = 'Toggle Profiler' }
)

vim.keymap.set(
  { 'i', 'n', 'x' },
  '<F11>',
  function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end,
  { desc = 'Toggle Fullscreen' }
)

vim.keymap.set({ 'i', 'n', 'x' }, '<C-F5>', function()
  local autocmd_group_id = vim.api.nvim_create_augroup('Restart', { clear = true })

  local id = vim.api.nvim_create_autocmd('VimLeavePre', {
    group = autocmd_group_id,
    pattern = '*',
    callback = function() vim.fn.system('neovide') end,
  })

  vim.cmd('qa')

  vim.api.nvim_del_autocmd(id)
end, { desc = 'Restart Neovide' })

---@type LazySpec
return {
  'AstroNvim/astrocore',
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        guifont = 'JetBrainsMonoNL Nerd Font:h11',
        linespace = 0,
      },
      g = {
        neovide_scale_factor = 1.0,
        neovide_floating_shadow = false,
        neovide_title_background_color = 'black',
        neovide_title_text_color = 'gray',
        neovide_floating_blur_amount_x = 0,
        neovide_floating_blur_amount_y = 0,
        neovide_position_animation_length = 0.06,
        neovide_scroll_animation_length = 0.04,
        neovide_scroll_animation_far_lines = 5,
        neovide_refresh_rate = 165, -- This setting is only effective when not using vsync, for example by passing --no-vsync on the commandline.
        -- neovide_refresh_rate_idle = 165,
        neovide_no_idle = true,
        -- neovide_profiler = true, -- frametime graph
        neovide_cursor_animation_length = 0.03,
        neovide_cursor_short_animation_length = 0,
        neovide_cursor_animate_in_insert_mode = false,
        -- neovide_cursor_vfx_mode = 'pixiedust',
      },
    },
  },
}
