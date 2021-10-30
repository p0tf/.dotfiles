local gl = require('galaxyline')
local gls = gl.section
local cond = require('galaxyline.condition')

-- -- One Light
-- local colors = {
--   dark_black = '#494b53',
--   black = '#696c77',
--   dark_grey = '#a0a1a7', grey = '#c2c2c3',
--   cyan = '#0184bc',
--   blue = '#4078f2',
--   purple = '#a626a4',
--   green = '#50a14f',
--   dark_red = '#e45649',
--   red = '#ca1243',
--   dark_yellow = '#986801',
--   yellow = '#c18401',
--   bg_green = '#98c379',
--   bg_purple = '#c678dd',
--   bg_yellow = '#e5c07b',
--   bg = '#fafafa',
--   gutter = '#9e9e9e',
--   cursor = '#f0f0f0',
--   accent = '#526fff',
--   accent2 = '#0083be',
--   vertsplit = '#e7e9e1',
--   special_grey = '#d3d3d3',
--   visual_grey = '#d0d0d0',
--   pmenu = '#dfdfdf',
--   git = '#f14e32',
-- }
local colors = {
  black = 0,
  red = 1,
  green = 2,
  yellow = 3,
  blue = 4,
  purple = 5,
  cyan = 6,
  white = 7,
}

local icon_colors = {
  [''] = 1,
  [''] = 2,
  [''] = 1,
  [''] = 6,
  [''] = 4,
  [''] = 11,
  [''] = 3,
  [''] = 1,
  [''] = 5,
  [''] = 2,
  [''] = 6,
  [''] = 4,
  [''] = 6,
  [''] = 1,
  [''] = 4,
  [''] = 4,
  [''] = 1,
  [''] = 6,
  [''] = 6,
  [''] = 1,
  [''] = 2,
  [''] = 4,
  [''] = 4,
  [''] = 2,
  [''] = 2,
  [''] = 3,
  [''] = 2,
  [''] = 6,
  [''] = 1,
  [''] = 6,
  [''] = 1,
  [''] = 6,
  [''] = 1,
  [''] = 6,
  [''] = 6,
  [''] = 4,
  [''] = 3,
  [''] = 5,
  [''] = 1,
  [''] = 1,
  [''] = 2,
  [''] = 11,
  [''] = 4,
  [''] = 1,
  [''] = 4,
  [''] = 4,
  [''] = 6,
  [''] = 4,
  [''] = 4,
  ['ﳒ'] = 4,
  ['鉶'] = 4,
  [''] = 1,
  [''] = 5,
  [''] = 1,
  [''] = 5,
  [''] = 2,
  [''] = 1,
  [''] = 4,
  [''] = 2,
  ['﵂'] = 2,
  [''] = 1,
}

local function get_icon_color(icon)
  local color = icon_colors[icon]
  if color == nil then
    return ''
  else
    return color
  end
end

local bg_grey = 0
if vim.o.background == "light" then
  bg_grey = 15
else
  bg_grey = 0
end

local function set_highlight(group, fg, bg, kind)
  if fg ~= '' then
    fg = ' ctermfg=' .. fg
  end
  if bg ~= '' then
    bg = ' ctermbg=' .. bg
  end
  if kind ~= '' then
    kind = ' cterm=' .. kind
  end
  vim.cmd('hi Galaxy' .. group .. fg .. bg .. kind)
end

gls.left = {
  {
    ViMode = {
      provider = function()
        local alias = {
          n      = 'NOR',
          i      = 'INS',
          c      = 'CMD',
          v      = 'VIS',
          V      = 'VLINE',
          [''] = 'VBLOCK',
          s      = 'SEL',
          S      = 'SLINE',
          [''] = 'SBLOCK',
          R      = 'REP',
          t      = 'TER',
        }

        local mode_color = {
          n      = colors.green,
          i      = colors.blue,
          c      = colors.green,
          v      = colors.purple,
          V      = colors.purple,
          [''] = colors.purple,
          s      = colors.yellow,
          S      = colors.yellow,
          [''] = colors.yellow,
          R      = colors.red,
          r      = colors.cyan,
          t      = colors.blue,
        }
        local mode = vim.fn.mode():sub(1, 1)
        set_highlight('ViMode', mode_color[mode], '', 'bold,reverse')
        return '  ' .. alias[mode] .. ' '
      end,
      highlight = {}
    },
  },
  {
    FileIcon = {
      provider = function()
        local icon = vim.fn["nerdfont#find"](vim.fn.expand('%:p'))
        local color = get_icon_color(icon)
        set_highlight('FileIcon', color, bg_grey, '')
        return '  ' .. icon .. ' '
      end,
      condition = cond.buffer_not_empty,
      highlight = {},
    },
  },
  {
    FilePath = {
      provider = function()
        local max = vim.fn.winwidth(0) / 4
        local filename = vim.fn.expand('%:t')
        if #filename > max then
          return '...' .. filename:sub(-(max-3)) .. ' '
        else
          return filename .. ' '
        end
      end,
      condition = function()
        return cond.buffer_not_empty()
      end,
      highlight = 'Pmenu',
    }
  },
  {
    FileModified = {
      provider = function()
        if vim.bo.readonly and vim.bo.modified then
          set_highlight('FileModified', colors.red, bg_grey, '')
          return '  '
        elseif vim.bo.readonly then
          set_highlight('FileModified', colors.blue, bg_grey, '')
          return '  '
        elseif vim.bo.modified then
          set_highlight('FileModified', colors.green, bg_grey, '')
          return '  '
        end
      end,
      condition = function()
        return cond.buffer_not_empty()
      end,
      highlight = {},
    }
  },
  {
    GitIcon = {
      provider = function() return '   ' end,
      condition = cond.check_git_workspace,
      highlight = 'DiffDelete',
    }
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      highlight = 'Normal',
    }
  },
  {
    Separator = {
      provider = function() return '   ' end,
      highlight = 'Normal',
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = cond.hide_in_width,
      icon = '  ',
      highlight = 'DiffAdd',
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      condition = cond.hide_in_width,
      icon = '  ',
      highlight = 'DiffChange',
    },
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = cond.hide_in_width,
      icon = '  ',
      highlight = 'DiffDelete',
    }
  },
}
gls.right = {
  {
    DiagnosticError = {
      provider = function() return vim.fn["lsp#get_buffer_diagnostics_counts"]().error .. ' ' end,
      condition = function() return vim.fn["lsp#get_buffer_diagnostics_counts"]().error ~= 0 end,
      icon = '   ',
      highlight = 'LspDiagnosticsSignError',
    }
  },
  {
    DiagnosticWarn = {
      provider = function() return vim.fn["lsp#get_buffer_diagnostics_counts"]().warning .. ' ' end,
      condition = function() return vim.fn["lsp#get_buffer_diagnostics_counts"]().warning ~= 0 end,
      icon = '   ',
      highlight = 'LspDiagnosticsSignWarning',
    }
  },
  {
    DiagnosticInfo = {
      provider = function() return vim.fn["lsp#get_buffer_diagnostics_counts"]().information .. ' ' end,
      condition = function() return vim.fn["lsp#get_buffer_diagnostics_counts"]().information ~= 0 end,
      icon = '   ',
      highlight = 'LspDiagnosticsSignInformation',
    }
  },
  {
    DiagnosticHint = {
      provider = function() return vim.fn["lsp#get_buffer_diagnostics_counts"]().hint .. ' ' end,
      condition = function() return vim.fn["lsp#get_buffer_diagnostics_counts"]().hint ~= 0 end,
      icon = '   ',
      highlight = 'LspDiagnosticsSignHint',
    }
  },
  {
    LineInfo = {
      provider = function()
        local line = vim.fn.line('.')
        local col = vim.fn.col('.')
        local total = vim.fn.line('$')
        return string.format("  %d:%d(%d%%) ", line, col, math.floor((line/total)*100+0.5))
      end,
      highlight = 'GalaxyViMode',
    }
  },
}
