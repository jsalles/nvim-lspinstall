return {
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
	default_config = {
		cmd = { "node", "./stylelint_lsp/dist/index.js", "--stdio" },
		filetypes = { "css", "less", "scss" },
		root_dir = require("lspconfig").util.root_pattern(".git", vim.fn.getcwd()),
		init_options = {
			provideFormatter = true,
		},
		settings = {
			stylelintplus = {
				autoFixOnFormat = true,
				autoFixOnSave = true,
			},
		},
	},
}
