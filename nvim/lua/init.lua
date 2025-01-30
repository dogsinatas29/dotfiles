-- gruvbox baby lua Settings
-- Example config in Lua
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "italic"

-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
vim.g.gruvbox_baby_highlights = {Normal = {fg = "#123123", bg = "NONE", style="underline"}}

require('telescope').setup {
  defaults = {
    find_command = {
      "find", ".",
      "-type", "f",
      "-not", "-iregex", ".*\\.\\(png\\|jpg\\|jpeg\\|gif\\|bmp\\|webp\\)$",
      "-print",
    },
  },
}
vim.opt.path = { ".", "~/.config", "/mtn/HDD/문서**", "~/.local/share/nvim/plugged/**" }
-- Enable telescope theme
-- vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
-- vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
-- vim.cmd[[colorscheme gruvbox-baby]]

-- gruvbox baby를 사용한 telescope 테마
--telescope.setup({
--  defaults = {
--    ...
--    borderchars = {
--      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
--      results = { " " },
--      preview = { " " },
--    },
--  }
--})
--
local colors = require("gruvbox-baby.colors").config()
vim.g.gruvbox_baby_highlights = {Normal = {fg = colors.orange}}

--
--
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

