return {
	'ndonfris/fish-lsp',
	config = function()
		-- vim.api.nvim_create_autocmd('FileType', {
		-- 	pattern = 'fish',
		-- 	callback = function()
		-- 		vim.lsp.start({
		-- 			name = 'fish-lsp',
		-- 			cmd = { 'fish-lsp', 'start' },
		-- 			cmd_env = { fish_lsp_show_client_popups = false },
		-- 		})
		-- 	end,
		-- })

		-- local lspconfig =

		-- Define the autocommands using the nvim API
		-- local group = vim.api.nvim_create_augroup('FishLSP', { clear = true })

		vim.api.nvim_create_autocmd({ 'BufWritePre', 'BufEnter' }, {
			group = vim.api.nvim_create_augroup('FishLSP', { clear = true }),
			pattern = '*.fish',
			callback = function()
				require('lspconfig').fish_lsp.setup({
					cmd = { 'fish-lsp', 'start' },
					cmd_env = { fish_lsp_show_client_popups = false },
					filetypes = { 'fish' },
				})
			end,
		})
	end,
}
