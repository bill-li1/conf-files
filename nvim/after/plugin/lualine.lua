local status, lualine = pcall(require, "lualine")
if (not status) then return end

require('lualine').setup {
  options = {
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode' },
    },
    lualine_b = { { 'branch' } },
    lualine_c = { {'filename', file_status = true, path = 0 } },
    lualine_x = {
      { 'diagnostics',
        sources = { "nvim_diagnostic" } ,
        symbols = {error = '● ', warn = '● ', info = '● ', hint = '● '},
      },
    },
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location' },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = { 'fugitive'},
}

