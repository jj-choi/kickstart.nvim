local o = vim.o
local opt = vim.opt
----- Interesting Options -----

-- You have to turn this one on :)
o.inccommand = 'split'

-- Best search settings :)
o.smartcase = true
o.ignorecase = true

----- Personal Preferences -----
o.number = true
o.relativenumber = true

o.signcolumn = 'yes'
-- o.shada = { "'10", '<0', 's10', 'h' }
o.shada = "'10,<0,s10,h"

-- Don't have `o` add a comment
-- o.formatoptions:remove 'o'
opt.formatoptions:remove('o')
  
-- Kickstart
-- [[ Setting options ]]
-- See `:help o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Enable mouse mode, can be useful for resizing splits for example!
o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- optionally enable 24-bit colour
vim.o.termguicolors = true

-- Sync clipboard between OS and Neo
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Sets how neowill display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
o.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Show which line your cursor is on
o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
-- o.expandtab = trueo.splitbelow = true

-- Sets how neowill display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Show which line your cursor is on
o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
-- o.expandtab = true
