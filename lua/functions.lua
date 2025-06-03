local M = {}

function M.win_move(key)
	local cur_win = vim.api.nvim_get_current_win()
	vim.cmd('wincmd ' .. key)

	if cur_win == vim.api.nvim_get_current_win() then
		if key == 'j' or key == 'k' then
			vim.cmd('wincmd s')
		else
			vim.cmd('wincmd v')
		end
		vim.cmd('wincmd ' .. key)
	end
end

return M
