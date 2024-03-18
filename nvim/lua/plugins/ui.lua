return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
			timeout = 5000,
		},
	},

	-- animations
	{
		"echasnovski/mini.animate",
		enabled = false,
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<S-Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 3,
			trim_scope = "inner",
			separator = "-",
		},
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				-- globalstatus = false,
				theme = "gruvbox",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
		},
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			local logo = [[
     ██╗██████╗    ██████╗ ███████╗██╗   ██╗
     ██║██╔══██╗   ██╔══██╗██╔════╝██║   ██║
     ██║██████╔╝   ██║  ██║█████╗  ██║   ██║
██   ██║██╔══██╗   ██║  ██║██╔══╝  ╚██╗ ██╔╝
╚█████╔╝██║  ██║██╗██████╔╝███████╗ ╚████╔╝ 
 ╚════╝ ╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝  ╚═══╝  
      ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
		end,
	},
}
