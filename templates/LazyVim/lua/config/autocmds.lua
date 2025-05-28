-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


-- Create an autocommand group to hold the cursor shape autocommands.
-- { clear = true } ensures that the group is cleared when this code is re-sourced,
-- preventing duplicate autocommands.
local cursorShapeGroup = vim.api.nvim_create_augroup("CursorShapeAutocmds", { clear = true })

-- Define the guicursor strings
local guicursor_active = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
local guicursor_inactive = "a:block-blinkon0"

-- Autocommand for when Neovim is entered or resumed
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
    group = cursorShapeGroup,
    pattern = "*",
    desc = "Set active cursor shape on VimEnter/VimResume",
    callback = function()
        vim.opt.guicursor = guicursor_active
    end,
})

-- Autocommand for when Neovim is left or suspended
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
    group = cursorShapeGroup,
    pattern = "*",
    desc = "Set inactive/block cursor shape on VimLeave/VimSuspend",
    callback = function()
        vim.opt.guicursor = guicursor_inactive
    end,
})
