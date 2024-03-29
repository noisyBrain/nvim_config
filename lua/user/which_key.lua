local key = SafeRequire("which-key")

if not key then
  return
end

key.setup {
plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = true,
      g = false,
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = '<c-d>',
    scroll_up = '<c-u>',
  },
  window = {
    border = "none",
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
  show_help = false,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local files = {
  name = "Files",
  a = { ":Telescope emoji<cr>", "find emojis" },
  b = { ":Telescope buffers<cr>", "find open buffers" },
  c = { ":NvimTreeCollapse<cr>", "collapse tree" },
  e = { ":NvimTreeToggle<cr>", "show tree" },
  f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
  g = { ":Telescope live_grep<cr>", "search any world" },
  h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "help tags" },
  n = { "<cmd>lua require('telescope.builtin').find_files({ prompt_title = ' Find config ', cwd = '~/.config/nvim/'})<cr>", "find nvim config" },
}

local gs = require("gitsigns")

 local git = {
  name = "Git",
  n = {
    function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, "go to next hunk",
  },
  p = {
    function()
     if vim.wo.diff then return '[c' end
     vim.schedule(function() gs.prev_hunk() end)
     return '<Ignore>'
    end, "go to previous hunk",
  },
  a = { "<cmd>Gitsigns blame_line<cr>", "simple git blame" },
  b = { "<cmd>Gitsigns stage_buffer<cr>", "stage buffer" },
  c = { "<cmd>DiffviewClose<cr>", "close gitdiff" },
  d = { gs.diffthis, "show diff in the file" },
  g = { "<cmd>Neogit kind=tab<cr>", "Git management" },
  s = { "<cmd>Gitsigns stage_hunk<cr>", "stage hunk" },
  r = { "<cmd>Gitsigns reset_hunk<cr>", "reset hunk" },
  u = { gs.undo_stage_hunk, "undo stage junk" },
  v = { "<cmd>DiffviewOpen<cr>", "show diff in any files"},
  B = { function() gs.blame_line({full = true}) end, "blame line" },
  P = { gs.preview_hunk, "preview hunk" },
  R = { gs.reset_buffer, "reset buffer" },
 }

 local lsp = {
  name = "Lsp",
  a = { ":Lspsaga code_action<cr>", "code action" },
  f = { ":Lspsaga finder<cr>", "find definitions and references" },
  g = { ":Lspsaga goto_definition<cr>", "go to definition" },
  h = { ":Lspsaga hover_doc<cr>", "hover doc" },
  i = { ":Lspsaga incoming_calls<cr>", "incoming calls" },

  o = {
   l = { ":Lspsaga outline<cr>", "view outline" },
   c = { ":Lspsaga outgoing_calls<cr>", "outgoing calls" },
   "out view" },

  p = { ":Lspsaga peek_definition<cr>", "preview definition"},
  r = { ":Lspsaga rename<cr>", "rename identifiers"},

  s = {
   l = { ":Lspsaga show_line_diagnostics<cr>", "show inline diagnostics"},
   b = { ":Lspsaga show_buf_diagnostics<cr>", "show buffer diagnostics"},
  "show" },

  ["[e"] = { ":Lspsaga diagnostic_jump_prev<cr>", "goto previous error"},
  ["]e"] = { ":Lspsaga diagnostic_jump_next<cr>", "goto next error"},
 }

local noice = {
  name = "Noice",
  t = { ":NoiceTelescope<cr>", "show noice output in telescope" }
}

 local test = {
  name = "Testing",
  n = { function() require("neotest").jump.next({status = 'failed'}) end, "jump next failed test"},
  p = { function() require("neotest").jump.prev({status = 'failed'} )end, "jump next failed test"},
  s = { function() require("neotest").summary.toggle() end, "test summary"},
  a = { function() require('neotest').run.attach({}) end, "attach to the current test runner"},
  S = { function() require('neotest').run.stop({}) end, "stop test" },
  r = { function() require('neotest').run.run()  end, "run current test" },
  l = { function() require('neotest').run.run_last()  end, "run last test" },
  o = { function() require('neotest').output.open({enter = true, short = true}) end, "open test output"},
  R = { function() require('neotest').run.run(vim.fn.expand('%')) end, "run all test in this file"},
  }

 local github = {
  name = "Github",
  c = {
    name = "+commits",
      c = { "<cmd>GHCloseCommit<cr>", "Close" },
      e = { "<cmd>GHExpandCommit<cr>", "Expand" },
      o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
      p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
      z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
  },

  i = {
    name = "+issues",
      p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
  },

  l = {
    name = "+litee",
      t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
  },

  r = {
    name = "+review",
      b = { "<cmd>GHStartReview<cr>", "Begin" },
      c = { "<cmd>GHCloseReview<cr>", "Close" },
      d = { "<cmd>GHDeleteReview<cr>", "Delete" },
      e = { "<cmd>GHExpandReview<cr>", "Expand" },
      s = { "<cmd>GHSubmitReview<cr>", "Submit" },
      z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
  },

  p = {
    name = "+pull Request",
      c = { "<cmd>GHClosePR<cr>", "Close" },
      d = { "<cmd>GHPRDetails<cr>", "Details" },
      e = { "<cmd>GHExpandPR<cr>", "Expand" },
      o = { "<cmd>GHOpenPR<cr>", "Open" },
      p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
      r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
      t = { "<cmd>GHOpenToPR<cr>", "Open To" },
      z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
  },

  t = {
    name = "+threads",
      c = { "<cmd>GHCreateThread<cr>", "Create" },
      n = { "<cmd>GHNextThread<cr>", "Next" },
      t = { "<cmd>GHToggleThread<cr>", "Toggle" },
  },
 }

 local packer = {
   name = "Packer",
     s = {"<cmd>:PackerSync<cr>", "sync plugins"},
     c = {"<cmd>:PackerClean<cr>", "clean plugins"},
     i = {"<cmd>:PackerInstall<cr>", "install plugins"},
     l = {"<cmd>:PackerLoad ", "load plugin"},
     S = {"<cmd>:PackerStatus<cr>", "plugins status"},
 }

local mind = {
  name = "Mind",
    p = { ":MindOpenProject<cr>", "Open project" },
    m = { ":MindOpenMain<cr>", "Open main" },
    c = { ":MindClose<cr>", "Close mind" },
}

 local markown = {
   name = "Markdow",
     p = {"<cmd>:Glow<cr>", "Preview in neovim"},
     P = {"<cmd>:MarkdownPreview<cr>", "preview in the browser"}
 }

 local toggleterm = {
  name = "Term",
    f = { ":Lspsaga term_toggle<cr>", "open float terminal" },
    h = { ":ToggleTerm direction=horizontal size=20<cr>", "open horizontal terminal" },
    v = { ":ToggleTerm direction=vertical size=90<cr>", "open vertical terminal" },
    nh = { ":ToggleTerm dir=~/.config/nvim direction=horizontal size=20<cr>", "open horizontal terminal in neovim dir" },
    nv = { ":ToggleTerm dir=~/.config/nvim direction=vertical size=100<cr>", "open vertical terminal in neovim dir" },
}

local dap = {
  name = "Dap",
  b = { ":DapToggleBreakpoint<cr>", "toggle breakpoint" },
  r = { ":DapContinue<cr>", "Start or continue the debugger" }
}

 local zenmode = {
   name = "ZenMode",
   m = {"<cmd>:ZenMode<cr>", "Toggle ZenMode"},
 }

key.register(dap, { prefix = "<leader>d" })
key.register(files, { prefix = "<leader>f" })
key.register(git, { prefix = "<leader>g" })
key.register(github, { prefix = "<leader>h" })
key.register(noice, { prefix = "<leader>i" })
key.register(lsp, { prefix = "<leader>l" })
key.register(mind, { prefix = "<leader>m" })
key.register(markown, { prefix = "<leader>M" })
key.register(packer, { prefix = "<leader>p" })
key.register(toggleterm, { prefix = "<leader>q" })
key.register(test, { prefix = "<leader>t" })
key.register(zenmode, { prefix = "<leader>z" })
