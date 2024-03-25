return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				-- flavour = "auto" -- will respect terminal's background
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
