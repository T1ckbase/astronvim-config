-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMonoNL Nerd Font:h11'
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_title_background_color = 'black'
  vim.g.neovide_title_text_color = 'gray'
  vim.g.neovide_floating_blur_amount_x = 0
  vim.g.neovide_floating_blur_amount_y = 0
  vim.g.neovide_position_animation_length = 0.06
  vim.g.neovide_scroll_animation_length = 0.04
  vim.g.neovide_scroll_animation_far_lines = 5
  vim.g.neovide_refresh_rate = 165 -- This setting is only effective when not using vsync, for example by passing --no-vsync on the commandline.
  -- vim.g.neovide_refresh_rate_idle = 165
  vim.g.neovide_no_idle = true
  -- vim.g.neovide_profiler = true -- frametime graph
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_short_animation_length = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  -- vim.g.neovide_cursor_vfx_mode = 'pixiedust'

  vim.keymap.set(
    '',
    '<F10>',
    function() vim.g.neovide_profiler = not vim.g.neovide_profiler end,
    { desc = 'Toggle Profiler' }
  )

  vim.keymap.set(
    '',
    '<F11>',
    function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end,
    { desc = 'Toggle Fullscreen' }
  )

  vim.keymap.set('', '<C-F5>', function()
    local autocmd_group_id = vim.api.nvim_create_augroup('Restart', { clear = true })

    local id = vim.api.nvim_create_autocmd('VimLeavePre', {
      group = autocmd_group_id,
      pattern = '*',
      callback = function() vim.fn.system('neovide') end,
    })

    vim.cmd('qa')

    vim.api.nvim_del_autocmd(id)
  end, { desc = 'Restart Neovide' })
end

vim.keymap.set({ 'i', 'c' }, '<C-S-v>', '<C-r>+', { desc = 'Paste from system clipboard' })

vim.keymap.set('i', '<C-/>', '<ESC>mbgcc`ba', { desc = 'Toggle comment', remap = true })
vim.keymap.set('n', '<C-/>', 'mbgcc`b', { desc = 'Toggle comment', remap = true })
vim.keymap.set('v', '<C-/>', 'mbgc`b', { desc = 'Toggle comment', remap = true })
vim.keymap.set('n', '<M-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vim.keymap.set('n', '<M-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vim.keymap.set('i', '<M-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<M-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<M-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<M-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })
vim.keymap.set({ 'n', 'i' }, '<M-J>', '<Cmd>copy .<cr>', { desc = 'Copy Line Down' })
vim.keymap.set({ 'n', 'i' }, '<M-K>', '<Cmd>copy .-1<cr>', { desc = 'Copy Line Up' })
vim.keymap.set('v', '<M-J>', ":<C-u>'<,'>copy '<-1<cr>gv=gv", { desc = 'Copy Selection Down' })
vim.keymap.set('v', '<M-K>', ":<C-u>'<,'>copy '><cr>gv=gv", { desc = 'Copy Selection Up' })

vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = function()
    if vim.o.background ~= 'dark' then vim.schedule(function() vim.opt.background = 'dark' end) end
  end,
})

vim.api.nvim_create_user_command('Test', function()
  local ns_id1 = vim.api.nvim_create_namespace('ns1')
  local ns_id2 = vim.api.nvim_create_namespace('ns2')

  vim.api.nvim_buf_set_extmark(0, ns_id1, 5, 5, { virt_text = { { 'Text A', 'Normal' } }, virt_text_pos = 'eol' })
  vim.api.nvim_buf_set_extmark(0, ns_id2, 5, 5, { virt_text = { { 'Text B', 'Normal' } }, virt_text_pos = 'eol' })
end, {})

-- vim.keymap.set('n', '<C-S-v>', function() vim.notify('Hello') end, { desc = 'Test' })
-- vim.notify
