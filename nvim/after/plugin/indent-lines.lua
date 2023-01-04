vim.cmd [[highlight IndentBlanklineIndent1 guifg=#444444 gui=nocombine]]

require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}
