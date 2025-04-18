-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- catpuccin themes
	-- {
	--   {
	--     'catppuccin/nvim',
	--     name = 'catppuccin',
	--     priority = 1000,
	--     config = function()
	--       require('catppuccin').setup {
	--         flavour = 'mocha', -- latte, frappe, macchiato, mocha
	--         background = { -- :h background
	--           light = 'latte',
	--           dark = 'mocha',
	--         },
	--         transparent_background = true, -- disables setting the background color.
	--         show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	--         term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	--         dim_inactive = {
	--           enabled = false, -- dims the background color of inactive window
	--           shade = 'dark',
	--           percentage = 0.15, -- percentage of the shade to apply to the inactive window
	--         },
	--         no_italic = false, -- Force no italic
	--         no_bold = false, -- Force no bold
	--         no_underline = false, -- Force no underline
	--         styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
	--           comments = { 'italic' }, -- Change the style of comments
	--           conditionals = { 'italic' },
	--           loops = {},
	--           functions = {},
	--           keywords = {},
	--           strings = {},
	--           variables = {},
	--           numbers = {},
	--           booleans = {},
	--           properties = {},
	--           types = {},
	--           operators = {},
	--           -- miscs = {}, -- Uncomment to turn off hard-coded styles
	--         },
	--         color_overrides = {},
	--         custom_highlights = {},
	--         default_integrations = true,
	--         integrations = {
	--           cmp = true,
	--           gitsigns = true,
	--           nvimtree = true,
	--           treesitter = true,
	--           notify = false,
	--           mini = {
	--             enabled = true,
	--             indentscope_color = '',
	--           },
	--           -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	--         },
	--       }
	--       vim.cmd.colorscheme 'catppuccin-mocha'
	--     end,
	--   },
	-- },
	--gruvbox.nvim
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- Default options:
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},
	--oil nvim
	{
		{
			"stevearc/oil.nvim",
			---@module 'oil'
			---@type oil.SetupOpts
			opts = {},
			-- Optional dependencies
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
			-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
			-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
			lazy = false,
			config = function()
				require("oil").setup({
					view_options = {
						show_hidden = true,
					},
				})
				vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			end,
		},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	-- codeium ai completion
	-- {
	--   'Exafunction/codeium.nvim',
	--   dependencies = {
	--     'nvim-lua/plenary.nvim',
	--     'hrsh7th/nvim-cmp',
	--   },
	--   config = function()
	--     require('codeium').setup {}
	--   end,
	-- },
	--autopair plugin
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	-- supermaven code completion
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			disable_inline_completion = true,
	-- 		})
	-- 	end,
	-- },
	--move.nvim
	{
		"fedepujol/move.nvim",
		config = function()
			require("move").setup({
				vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts),
				vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts),
				vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts),
				vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts),
				vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts),
				vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts),

				-- Visual-mode commands
				vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts),
				vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts),
				vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts),
				vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts),
			})
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
		end,
	},
	--zen mode nvim (folke)
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			require("zen-mode").setup({
				window = {
					width = 0.80,
				},
			})
		end,
	},
	--augment code
	{
		"augmentcode/augment.vim",
		config = function()
			-- add your own keybindings here
		end,
	},

	--typescript-tools.nvim
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

	--avante.nvim
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- Never set this value to "*"! Never!
		opts = {
			-- add any opts here
			-- for example
			provider = "gemini",
			-- cursor_applying_provider = 'groq',
			-- behaviour = {
			-- 	--- ... existing behaviours
			-- 	enable_cursor_planning_mode = true, -- enable cursor planning mode!
			-- },
			gemini = {
				model = "gemini-2.0-flash",
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},

	--nvim-ts-autotag
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	--lazygit.nvim
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
		end,
	},
}
