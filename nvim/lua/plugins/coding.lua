local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

return {
	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<CR>"] = cmp.config.disable,
				["<C-s>"] = cmp.mapping.confirm({ select = true }),
			})

			opts.formatting = {
				fields = { "abbr", "kind", "menu" },
				expandable_indicator = true,
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
					-- Source
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					return vim_item
				end,
			}
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			---@diagnostic disable-next-line: missing-parameter
			harpoon:setup({
				settings = {
					save_on_toggle = true,
					save_on_change = true,
					save_on_ui_close = true,
				},
			})
			local function map(lhs, rhs, opts)
				vim.keymap.set("n", lhs, rhs, opts or {})
			end
			map(",a", function()
				harpoon:list():append()
			end)
			map(",e", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)
			map(",h", function()
				harpoon:list():select(1)
				vim.cmd("set nu rnu | se cursorline")
			end)
			map(",t", function()
				harpoon:list():select(2)
				vim.cmd("set nu rnu | se cursorline")
			end)
			map(",n", function()
				harpoon:list():select(3)
				vim.cmd("set nu rnu | se cursorline")
			end)
			map(",s", function()
				harpoon:list():select(4)
				vim.cmd("set nu rnu | se cursorline")
			end)
		end,
	},
}
