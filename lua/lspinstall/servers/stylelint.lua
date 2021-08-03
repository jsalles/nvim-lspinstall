local config = require("lspinstall/util").extract_config("stylelint_lsp")
config.default_config.cmd[1] = "./stylelint_lsp/dist/index.js"

return vim.tbl_extend("error", config, {
	install_script = [[
  curl -o stylelint.tar.gz -L https://github.com/bmatcuk/stylelint-lsp/archive/refs/tags/v1.2.4.tar.gz
  rm -rf stylelint
  mkdir stylelint
  tar -xzf stylelint.tar.gz -C stylelint --strip-components 1
  rm stylelint.tar.gz

  cd stylelint
  npm install
  npm run build

  cd ..
  rm -rf stylelint_lsp
  mkdir stylelint_lsp
  cp -r stylelint/node_modules stylelint_lsp
  cp -r stylelint/dist stylelint_lsp

  rm -rf stylelint
  ]],
})
