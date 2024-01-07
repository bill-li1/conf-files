return {
	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
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
			end)
			map(",t", function()
				harpoon:list():select(2)
			end)
			map(",n", function()
				harpoon:list():select(3)
			end)
			map(",s", function()
				harpoon:list():select(4)
			end)
		end,
	},
}
