--- personal preferences

-- change leader key
vim.g.mapleader=";"

-- set numbering
vim.opt.relativenumber = true
vim.opt.number = true

-- set tab to display as 4 spaces, shifting to shift 4 spaces(>> and <<)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- keep 8 lines on bottom/top when scrolling
vim.opt.scrolloff = 8

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- remove persistent search highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true


---- cool remaps

-- move stuff in visual mode with J/K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep search terms in middle
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- use ctrl+hjkl to move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- prettier shortcut
vim.keymap.set("n", "<leader>p", "<cmd> Prettier <CR>")

-- code action shortcut
vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")


---- lazy.nvim setup

-- Lazy sync shortcut
vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd> Lazy sync <CR>", {})

-- neo-tree toggle
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd> NeoTreeRevealToggle <CR>", {})

-- download lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim install packages
return require('lazy').setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { 
            {"nvim-lua/plenary.nvim"},
            {"nvim-tree/nvim-web-devicons"}, -- not strictly required, but recommended
            {"MunifTanjim/nui.nvim"},
        }
    },

	"windwp/nvim-autopairs",

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},

	"lukas-reineke/indent-blankline.nvim",
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},

	{ 'echasnovski/mini.surround', version = false,
		config = function()
			require('mini.surround').setup()
		end
	},

	-- setup for prettier
	'neovim/nvim-lspconfig',
	'jose-elias-alvarez/null-ls.nvim',
	'MunifTanjim/prettier.nvim',

	-- noice.nvim (optional, trying it out)

	--[[ {
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	}, ]]
 
	-- themes

	{
		'rose-pine/neovim',
		as = 'rose-pine',
	},
	"catppuccin/nvim", 
	'folke/tokyonight.nvim',
	'morhetz/gruvbox',
	"rebelot/kanagawa.nvim",
})


