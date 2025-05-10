--return {
--  'stevearc/conform.nvim',
--  config = function()
--    require('conform').setup {
--      debug = true,
--      formatters_by_ft = {
--			        lua = { 'stylua' },
--        sh = { 'shfmt' },
--        bash = { 'shfmt' },
--        zsh = { 'shfmt' },
--        javascript = { 'prettier' },
--        typescript = { 'prettier' },
--        html = { 'prettier' },
--        css = { 'prettier' },
--        json = { 'prettier' },
--        markdown = { 'prettier' },
--        yaml = { 'prettier' },
--      },
--    }
--  end,
--}

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			debug = true,
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				yaml = { "prettier" },
			},
		})

		-- Add this block to enable format-on-save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
