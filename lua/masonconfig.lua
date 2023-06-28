-- this needs to be in this order (for some unspecified reason)
require("mason").setup()
require("mason-lspconfig").setup()

-- formatting with lsp
-- this needs to be setup first and THEN passed to every single lsp below.
-- annoying.
require("lsp-format").setup {}

-- now we can set up all lsp's
-- require("lspwhatever").setup {}
require("lspconfig").rust_analyzer.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").cssls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").emmet_ls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").tsserver.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").lua_ls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").rust_analyzer.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").tailwindcss.setup { on_attach = require("lsp-format").on_attach }

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- ill throw in tree-sitter here cause why not
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
}

require('nvim-ts-autotag').setup()
