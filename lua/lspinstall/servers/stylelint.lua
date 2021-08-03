local config = require("lspinstall/util").extract_config("stylelint_lsp")
config.default_config.cmd[1] = "./node_modules/.bin/stylelint-lsp"

return vim.tbl_extend("error", config, {
	install_script = [[
  ! test -f package.json && npm init -y scope=lspinstall || true
  npm install stylelint-lsp
  ]],
})
