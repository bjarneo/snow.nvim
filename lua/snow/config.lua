-- Ash theme configuration examples
-- This file demonstrates how to customize the theme

local snow = require("snow")

-- Example 1: Basic setup with default configuration
snow.setup()

-- Example 2: Custom configuration with disabled features
snow.setup({
	-- Disable transparent background for terminal users
	disable = {
		background = true, -- Use terminal background
		terminal_colors = false,
		italic_comments = false, -- Disable italic comments
	},

	-- Override specific colors
	colors = {
		-- Make comments more visible
		comment = "#6b7280",
		-- Change function color
		func = "#A855F7",
		-- Custom background (if not using terminal background)
		bg = "#1f2937",
	},

	-- Override specific highlights
	highlights = {
		-- Make TODO comments stand out more
		Todo = { fg = "#FBBF24", bg = "#1f2937", bold = true },
		-- Custom cursor line
		CursorLine = { bg = "#374151" },
		-- Custom search highlight
		Search = { fg = "#1f2937", bg = "#10B981" },
	},

	-- Disable specific plugin integrations
	plugins = {
		treesitter = true,
		lsp = true,
		telescope = true,
		nvimtree = false, -- Disable NvimTree integration
		whichkey = true,
		gitsigns = true,
		indent_blankline = true,
		markdown = true,
	},
})

-- Example 3: Minimal setup for performance
snow.setup({
	plugins = {
		treesitter = true,
		lsp = true,
		telescope = false,
		nvimtree = false,
		whichkey = false,
		gitsigns = false,
		indent_blankline = false,
		markdown = false,
	},
})

-- Example 4: High contrast setup
snow.setup({
	colors = {
		-- Darker background for higher contrast
		bg = "#0f0f0f",
		bg_alt = "#1a1a1a",
		bg_highlight = "#2a2a2a",

		-- Brighter foreground
		fg = "#ffffff",

		-- More vibrant colors
		string = "#00ff88",
		keyword = "#ff9500",
		func = "#bf5af2",
		type = "#ff6b6b",
		constant = "#32d74b",
	},
})

-- Example 5: Custom theme variant (if you want to create your own)
local custom_colors = {
	bg = "#1a1a1a",
	fg = "#e6e6e6",
	comment = "#666666",
	func = "#ff79c6",
	string = "#50fa7b",
	keyword = "#ff9900",
	type = "#8be9fd",
	constant = "#bd93f9",
	-- ... add more custom colors
}

snow.setup({
	colors = custom_colors,
})

-- After setup, load the colorscheme
snow.load()

-- Or use the traditional method
-- vim.cmd('colorscheme snow')

--[[
Usage in your init.lua:

-- Option 1: Simple setup
require('snow').setup()
vim.cmd('colorscheme snow')

-- Option 2: With configuration
require('snow').setup({
  disable = {
    background = true,
  },
  colors = {
    comment = '#6b7280',
  },
})
require('snow').load()

-- Option 3: With lazy.nvim
{
  'bjarneo/snow.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    disable = {
      background = true,
    },
  },
  config = function(_, opts)
    require('snow').setup(opts)
    vim.cmd('colorscheme snow')
  end,
}
--]]
