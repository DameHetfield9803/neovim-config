vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader=" "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- for code runner specifically

require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python3 = {
            "python3 $fileName"
        },
    typescript = { "deno run" },
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
        }
    ,
    go = {
        "go run"
    },
    lua = {
            "cd $dir &&",
            "luajit $fileName"
        },
  },
})

-- Mason setup
require("mason").setup()

local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>',builtin.find_files, {})
vim.keymap.set('n','<leader>fg',builtin.live_grep,{})
vim.keymap.set('n', '<C-n>',':Neotree filesystem reveal left<CR>')

local configs = require("nvim-treesitter.configs")

configs.setup({
        ensure_installed = { "typescript", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "go" , "javascript", "html", "vue" },
          highlight = { enable = true },
          indent = { enable = true },  
})

require("catppuccin").setup()
require("catppuccin").load "mocha"
vim.cmd.colorscheme "catppuccin-mocha"
