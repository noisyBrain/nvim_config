local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

local mappings = {

  -- Reload config
  {"n", "<leader>r", ":so %<cr>"},

  -- Buffers
  {"n", "<leader>ef", ":bdelete!<cr>"},

  -- Prettier
  {"n", "<leader>pt", ":Prettier<cr>"},

  -- Split window
  {"n", "<leader>vs", ":vsplit<cr>"},
  {"n", "<leader>s", ":split<cr>"},

  -- No hightlight
  {"n", "<ESC>", ":nohl<cr>"},

  -- Go to the start and the end of the line
  {"n", "<leader>k", "$"},
  {"n", "<leader>j", "_"},

  -- Better window navigation
  {"n", "<C-h>", "<C-w>h"},
  {"n", "<C-j>", "<C-w>j"},
  {"n", "<C-k>", "<C-w>k"},
  {"n", "<C-l>", "<C-w>l"},

  -- Resize with arrows
  {"n", "<C-Up>", ":resize -2<CR>"},
  {"n", "<C-Down>", ":resize +2<CR>"},
  {"n", "<C-Left>", ":vertical resize -2<CR>"},
  {"n", "<C-Right>", ":vertical resize +2<CR>"},

  -- Navigate buffers
  {"n", "<TAB>", ":bnext<CR>"},
  {"n", "<S-TAB>", ":bprevious<CR>"},

  -- Move text up and down
-- Normal-mode commands
  {'n', '<A-j>', ':MoveLine(1)<CR>'},
  {'n', '<A-k>', ':MoveLine(-1)<CR>'},
  {'n', '<A-h>', ':MoveHChar(-1)<CR>'},
  {'n', '<A-l>', ':MoveHChar(1)<CR>'},
  {'n', '<leader>wf', ':MoveWord(1)<CR>'},
  {'n', '<leader>wb', ':MoveWord(-1)<CR>'},

  -- Visual-mode commands
  {'v', '<A-j>', ':MoveBlock(1)<CR>', opts},
  {'v', '<A-k>', ':MoveBlock(-1)<CR>', opts},
  {'v', '<A-h>', ':MoveHBlock(-1)<CR>', opts},
  {'v', '<A-l>', ':MoveHBlock(1)<CR>', opts},

  -- Insert --
  -- Press jk fast to exit insert mode 
  {"i", "jk", "<ESC>"},

  -- Visual --
  -- Stay in indent mode
  {"v", "<", "<gv"},
  {"v", ">", ">gv"},

  -- Move text up and down
  {"v", "<A-j>", ":m .+1<CR>=="},
  {"v", "<A-k>", ":m .-2<CR>=="},
  {"v", "p", '"_dP'},

  -- Visual Block --
  -- Move text up and down
  {"x", "J", ":move '>+1<CR>gv-gv"},
  {"x", "K", ":move '<-2<CR>gv-gv"},

  -- Custom keymaps
  {"n", "<C-s>", "<cmd>:write<cr>"},

}

local function setKeymap(maps)
  for _, map in pairs(maps) do
    keymap(tostring(map[1]),tostring(map[2]),tostring(map[3]), opts )
  end
end


setKeymap(mappings)
