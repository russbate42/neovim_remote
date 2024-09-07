
print("hello from user")
print("For spelling type >>> :setlocal spell spelllang=en_us")

require("user.remap")
require("user.set")
require("user.packer")
require("autoclose").setup()
require("nvim-surround").setup()

-- COLORS
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- RAINBOW DELIMETERS
-- This module contains a number of default definitions
local rainbow_delimiters = require('rainbow-delimiters')

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = {'rainbow-blocks', 'rainbow-delimeters'},
        latex = 'rainbow-blocks' 
        -- latex = {'rainbow-blocks', 'rainbow-delimeters'},
    },
    priority = {
        [''] = 110,
        lua = 210,
        latex = 400
    },
    highlight = {
        'RainbowDelimiterOrange',
        'RainbowDelimiterCyan',
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterGreen',
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
    },
}

-- INDENT BLANKLINE
-- see :help ibl
require("ibl").setup()
require "ibl".overwrite {
    enabled = true,
    exclude = { filetypes = {} },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,
        highlight = { "Function", "Label", "Conditional", "Keyword",
            "Exception", "pythonConditional"},
        priority = 500,
    },
    -- indent = {
       -- char = "|",
       -- tab_char = { "a", "b", "c" },
       -- highlight = { "Conditional" },
       -- smart_indent_cap = true,
       -- priority = 2,
       -- repeat_linebreak = false,
    --}
}

-- NVIM SURROUND

-- COMMENT NVIM


