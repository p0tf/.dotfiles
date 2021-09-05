-- One Light
local colors = {
  dark_black = '#494b53',
  black = '#696c77',
  dark_grey = '#a0a1a7',
  grey = '#c2c2c3',
  cyan = '#0184bc',
  blue = '#4078f2',
  purple = '#a626a4',
  green = '#50a14f',
  dark_red = '#e45649',
  red = '#ca1243',
  dark_yellow = '#986801',
  yellow = '#c18401',
  bg_green = '#98c379',
  bg_purple = '#c678dd',
  bg_yellow = '#e5c07b',
  bg = '#fafafa',
  gutter = '#9e9e9e',
  cursor = '#f0f0f0',
  accent = '#526fff',
  accent2 = '#0083be',
  vertsplit = '#e7e9e1',
  special_grey = '#d3d3d3',
  visual_grey = '#d0d0d0',
  pmenu = '#dfdfdf',
  git = '#f14e32',
}

require('bufferline').setup {
  options = {
    numbers = 'none',
    indicator_icon = '',
    modified_icon = ' ',
    diagnostics = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    separator_style = {'', ''},
    always_show_bufferline = false,
    sort_by = 'id',
  },
  highlights = {
    fill = {
      guibg = colors.cursor,
    },
    background = {
      guifg = colors.grey,
      guibg = colors.cursor,
    },
    buffer_visible = {
      guifg = colors.grey,
      guibg = colors.cursor,
    },
    buffer_selected = {
      guibg = colors.bg,
      gui = '',
    },
    modified = {
      guifg = colors.bg_green,
      guibg = colors.cursor,
    },
    modified_visible = {
      guifg = colors.bg_green,
      guibg = colors.cursor,
    },
    modified_selected = {
      guifg = colors.green,
      guibg = colors.bg,
    },
  }
}

local u = require('utils')

u.csmap('n', 'b', 'BufferLineCyclePrev', 'BufferLineCycleNext')
u.cmap('n', 'bp', 'BufferLinePick')
u.cmap('n', 'bP', 'BufferLinePickClose')
u.cmap('n', 'b0', 'BufferLineGoToBuffer 1')
u.cmap('n', 'b;', "lua local b = require('bufferline'); b.go_to_buffer(1); b.cycle(-1)")

for i = 1, 9 do
  u.cmap('n', 'b' .. i , 'BufferLineGoToBuffer ' .. i)
end
