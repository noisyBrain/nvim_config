require('feline').setup({})
local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local force_inactive = {
  filetypes = {},
  buftypes = {},
  bufnames = {}
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}

local separators = {
  vertical_bar = '┃',
  vertical_bar_thin =	'│',
  left = '',
  right = '',
  block = '█',
  left_filled = '',
  right_filled = '',
  slant_left = '',
  slant_left_thin =	'',
  slant_right = '',
  slant_right_thin = '',
  slant_left_2 = '',
  slant_left_2_thin =	'',
  slant_right_2 = '',
  slant_right_2_thin = '',
  left_rounded = ' ',
  left_rounded_thin = '',
  right_rounded = '',
  right_rounded_thin = '',
  circle = ''
}

local colors2 = {
  bg = '#1e1e2e',
  black = '#11111b',
  yellow = '#f9e2af',
  cyan = '#74c7ec',
  oceanblue = '#89b4fa',
  green = '#a6e3a1',
  orange = '#fab387',
  violet = '#b4befe',
  magenta = '#cba6f7',
  white = '#f5e0dc',
  fg = '#f2cdcd',
  skyblue = '#89dceb',
  red = '#f38ba8',
}

local colors = {
  bg = '#1e1e2e',
  black = '#11111b',
  yellow = '#E5C07B', -- yellow
  cyan = '#56B6C2', -- turquesa
  oceanblue = '#89b4fa',
  green = '#33ff99',
  orange = '#ff9900',
  violet = '#b4befe',
  magenta = '#cba6f7',
  white = '#f5e0dc',
  fg = '#f2cdcd',
  skyblue = '#61AFEF', -- lightblue
  red = '#E06C75', -- red
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'skyblue',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

local vi_mode_text = {
  NORMAL = ' ' .. separators.slant_left .. separators.slant_right_2,
  OP = ' ',
  INSERT = ' ' .. separators.slant_left .. separators.slant_right_2,
  VISUAL = ' ',
  LINES = ' ',
  BLOCK = ' █',
  REPLACE = '<> ',
  ['V-REPLACE'] = ' ',
  ENTER = '<> ',
  MORE = '<> ',
  SELECT = '  ',
  COMMAND = '  ',
  SHELL = '',
  TERM = ' ',
  NONE = ' '
}

force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame'
}

force_inactive.buftypes = {
  'terminal'
}

-- LEFT

-- vi-mode
components.active[1][1] = {
  provider = '   ',
  hl = function()
    local val = {}

    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'black'
    val.style = 'bold'

    return val
  end,

  right_sep = {
    str = separators.slant_right_2,
    hl = function()
      local val = {}

      val.fg = vi_mode_utils.get_mode_color()

      return val
    end
  }
}

-- vi-symbol
components.active[1][2] = {
  provider = function()
    return vi_mode_text[vi_mode_utils.get_vim_mode()]
  end,
  hl = function()
    local val = {}

    val.fg = vi_mode_utils.get_mode_color()
    val.bg = 'bg'
    val.style = 'bold'

    return val
  end,
}

-- filename
components.active[1][3] = {
  provider = function()
    return vim.fn.expand("%:F")
  end,

  hl = function ()
    local val = {}

    val.fg = 'black'
    val.bg = '#33ccff'
    val.style = 'italic'

    return val
  end,

  left_sep = {
    str = ' ' .. separators.slant_left,
    hl = {
      fg = '#33ccff',
      bg = 'bg'
    }
  },

  right_sep = {
    str = separators.right_rounded,
    hl = function()
      local val = {}

      val.fg ='#33ccff'

      return val
    end
  }
}
-- MID

-- gitBranch
components.active[2][1] = {
  provider = 'git_branch',

  hl = {
    fg = 'black',
    bg = 'oceanblue',
    style = 'bold'
  },

  left_sep = {
    str = separators.left_rounded,
    h1 = {
      fg = 'oceanblue',
      bg = 'bg'
    }
  },

  right_sep = {
    str = ' ',
    h1 = {
      fg = 'oceanblue',
      bg = 'bg'
    }
  }
}
-- diffAdd
components.active[2][2] = {
  provider = 'git_diff_added',

  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'bold'
  },
}

-- diffModfified
components.active[2][3] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'bold'
  },
}

-- diffRemove
components.active[2][4] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold'
  },
}
-- diagnosticErrors
components.active[2][5] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
  hl = {
    fg = 'red',
    style = 'bold'
  },
}
-- diagnosticWarn
components.active[2][6] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
  hl = {
    fg = 'yellow',
    style = 'bold'
  },
}
-- diagnosticHint
components.active[2][7] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  },
}
-- diagnosticInfo
components.active[2][8] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  },
}

-- RIGHT

-- LspName
components.active[3][1] = {
  provider = 'lsp_client_names',
  hl = {
    fg = 'black',
    bg = '#dd21ce',
    style = 'bold'
  },

  left_sep = {
    str = separators.left_rounded,
    hl = {
      fg = '#dd21ce'
    }
  },

  right_sep = {
    str = separators.slant_right_2,
    hl = {
      fg = '#dd21ce'
    }
  },
}
-- fileIcon
components.active[3][2] = {
  provider = function()

    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon  = require'nvim-web-devicons'.get_icon(filename, extension)

    if icon == nil then
      icon = ''
    end
    return icon

  end,

  hl = function()

    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)

    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end

    val.bg = 'bg'
    val.style = 'bold'

    return val
  end,

  left_sep = {
    str = separators.left_rounded,
    hl = {
      fg = 'bg',
    }
  },

  right_sep = {
    str = ' ',
    hl = {
      bg = 'bg'
    }
  }
}
-- fileType
components.active[3][3] = {
  provider = 'file_type',
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'black'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,

  right_sep = {
    str = separators.slant_right .. ' ',
    hl = {
      fg = 'bg'
    }
  }
}

-- fileSize
components.active[3][4] = {
  provider = 'file_size',
  enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
  hl = {
    fg = 'skyblue',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- fileFormat
components.active[3][5] = {
  provider = function()
    return '' .. vim.bo.fileformat:upper() .. ' '
  end,

  hl = {
    fg = 'black',
    bg = 'white',
    style = 'bold'
  },

  left_sep = {
    str = separators.slant_left_2,
    h1 = {
      fg = 'white',
      bg = 'bg'
    }
  },

  right_sep = ' '
}
-- fileEncode
--[[ components.active[3][6] = { ]]
--[[   provider = 'file_encoding', ]]
--[[   hl = { ]]
--[[     fg = 'white', ]]
--[[     bg = 'bg', ]]
--[[     style = 'bold' ]]
--[[   }, ]]
--[[   right_sep = ' ' ]]
--[[ } ]]

-- lineInfo
components.active[3][8] = {
  provider = 'position',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- linePercent
components.active[3][9] = {
  provider = 'line_percentage',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}

-- scrollBar
components.active[3][10] = {
  provider = 'scroll_bar',
  hl = {
    fg = 'yellow',
    bg = 'bg',
  },
}

-- INACTIVE

-- fileType
components.inactive[1][1] = {
  provider = 'file_type',
  hl = {
    fg = 'black',
    bg = 'cyan',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'cyan'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    ' '
  }
}

require('feline').setup({
  theme = colors,
  default_bg = colors.bg,
  default_fg = colors.fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
})
