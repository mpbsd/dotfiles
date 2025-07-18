return {
	---@param KEY table
	MAP = function(KEY)
		for _, kmp in pairs(KEY) do
			local mod = kmp["mod"]
			local lhs = kmp["lhs"]
			local rhs = kmp["rhs"]
			local opt = kmp["opt"]
			vim.keymap.set(mod, lhs, rhs, opt)
		end
	end,
}
