local install_jsregexp = function()
	if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
		return
	end
	return "make install_jsregexp"
end

return {
	"L3MON4D3/LuaSnip",
	build = install_jsregexp(),
	config = function()
		local luasnip = require("luasnip")
		local extras = require("luasnip.extras")
		local format = require("luasnip.extras.fmt")
		local loaders = require("luasnip.loaders.from_lua")

		loaders.lazy_load({ paths = "~/.config/nvim/lua/mpbsd/snip" })

		luasnip.snip_env = {
			s = luasnip.snippet,
			sn = luasnip.snippet_node,
			t = luasnip.text_node,
			i = luasnip.insert_node,
			f = luasnip.function_node,
			c = luasnip.choice_node,
			d = luasnip.dynamic_node,
			r = luasnip.restore_node,
			l = extras.lambda,
			rep = extras.rep,
			p = extras.partial,
			m = extras.match,
			n = extras.nonempty,
			dl = extras.dynamic_lambda,
			fmt = format.fmt,
			fmta = format.fmta,
		}

		vim.keymap.set("n", "<localleader>es", function()
			require("luasnip.loaders").edit_snippet_files()
		end, { noremap = true, silent = true })
	end,
}
