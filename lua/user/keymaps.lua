local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


local mappings = {

  -- Buffers
  {"n", "<leader>ef", ":bd<cr>"},

  -- Prettier
  {"n", "<leader>pt", ":Prettier<cr>"},

  -- No hightlight
  {"n", "<leader>vs", ":vsplit<cr>"},

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
  {"n", "<A-j>", "<Esc>:m .+1<CR>==gi"},
  {"n", "<A-k>", "<Esc>:m .-2<CR>==gi"},

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
  {"x", "<A-j>", ":move '>+1<CR>gv-gv"},
  {"x", "<A-k>", ":move '<-2<CR>gv-gv"},

  -- Custom keymaps
  {"n", "<C-s>", "<cmd>:write<cr>"},

}

local function setKeymap(maps)
  for _, map in pairs(maps) do
    keymap(tostring(map[1]),tostring(map[2]),tostring(map[3]), opts )
  end
end


setKeymap(mappings)
