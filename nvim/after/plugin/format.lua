local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}

local clang_format = { formatCommand = 'clang-format -style=LLVM ${INPUT}', formatStdin = true }
local prettier = { formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}', formatStdin = true }

return {
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  markdown = { prettier },
  scss = { prettier },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  yaml = { prettier },
}
