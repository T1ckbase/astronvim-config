-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMonoNL NF:h11"
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_title_background_color = "black"
  vim.g.neovide_title_text_color = "gray"
  vim.g.neovide_position_animation_length = 0.06
  vim.g.neovide_scroll_animation_length = 0.04
  vim.g.neovide_scroll_animation_far_lines = 5
  vim.g.neovide_refresh_rate = 165 -- This setting is only effective when not using vsync, for example by passing --no-vsync on the commandline.
  -- vim.g.neovide_refresh_rate_idle = 165
  vim.g.neovide_no_idle = true
  -- vim.g.neovide_profiler = true -- frametime graph
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_cursor_short_animation_length = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_vfx_mode = "pixiedust"

  vim.keymap.set(
    "",
    "<F10>",
    function() vim.g.neovide_profiler = not vim.g.neovide_profiler end,
    { desc = "Toggle Profiler" }
  )

  vim.keymap.set(
    "",
    "<F11>",
    function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end,
    { desc = "Toggle Fullscreen" }
  )

  vim.keymap.set("", "<C-F5>", function()
    local autocmd_group_id = vim.api.nvim_create_augroup("Restart", { clear = true })

    local id = vim.api.nvim_create_autocmd("VimLeavePre", {
      group = autocmd_group_id,
      pattern = "*",
      callback = function() vim.fn.system "neovide" end,
    })

    vim.cmd "qa"

    vim.api.nvim_del_autocmd(id)
  end, { desc = "Restart Neovide" })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function() vim.opt_local.formatoptions:remove { "c", "r", "o" } end,
})

vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- vscode
vim.keymap.set("i", "<C-/>", "<ESC>mzgcc`za", { desc = "Toggle comment", remap = true })
vim.keymap.set("n", "<C-/>", "mzgcc`z", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<C-/>", "mzgc`z", { desc = "Toggle comment", remap = true })

vim.keymap.set("n", "<A-k>", "<Cmd> m .-2<CR>mz==j==k`z", { desc = "Move Line Up" })
vim.keymap.set("n", "<A-j>", "<Cmd> m .+1<CR>mz==k==j`z", { desc = "Move Line Down" })
vim.keymap.set("i", "<A-k>", "<Cmd> m .-2<CR><ESC>==j==kgi", { desc = "Move Line Up" })
vim.keymap.set("i", "<A-j>", "<Cmd> m .+1<CR><ESC>==k==jgi", { desc = "Move Line Down" })
vim.keymap.set("v", "<A-k>", "<Cmd> m '<-2<CR>gv=gv", { desc = "Move Line Up" })
vim.keymap.set("v", "<A-j>", "<Cmd> m '>+1<CR>gv=gv", { desc = "Move Line Down" })

vim.keymap.set({ "n", "i" }, "<A-K>", "<Cmd>copy .-1<cr>", { desc = "Copy Line Up" })
vim.keymap.set({ "n", "i" }, "<A-J>", "<Cmd>copy .<cr>", { desc = "Copy Line Down" })

vim.opt.scrolloff = 4
vim.opt.cursorline = false

-- vim.notify
