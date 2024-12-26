local build_function = function()
	if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
		return
	end
	return "make install_jsregexp"
end

return {
	"L3MON4D3/LuaSnip",
	build = build_function(),
	config = function()
		local luasnip = require("luasnip")
		local extras = require("luasnip.extras")
		local format = require("luasnip.extras.fmt")
		local types = require("luasnip.util.types")
		local conditions = require("luasnip.extras.expand_conditions")
		local loaders = require("luasnip.loaders.from_lua")

		loaders.load({ paths = "~/.config/nvim/lua/mpbsd/snip" })

		luasnip.snip_env = {
			snippet = luasnip.snippet,
			snippet_node = luasnip.snippet_node,
			text_node = luasnip.text_node,
			insert_node = luasnip.insert_node,
			function_node = luasnip.function_node,
			choice_node = luasnip.choice_node,
			dynamic_node = luasnip.dynamic_node,
			restore_node = luasnip.restore_node,
			lambda = extras.lambda,
			rep = extras.rep,
			partial = extras.partial,
			match = extras.match,
			nonempty = extras.nonempty,
			dynamic_lambda = extras.dynamic_lambda,
			fmt = format.fmt,
			fmta = format.fmta,
			types = types,
			conditions = conditions,
		}

		vim.keymap.set("n", "<leader>es", function()
			require("luasnip.loaders").edit_snippet_files()
		end, { noremap = true, silent = true })
	end,
}
