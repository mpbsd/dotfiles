local install_jsregexp = function()
	if vim.fn.executable("make") == 0 then
		return
	end
	return "make install_jsregexp"
end

return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	build = install_jsregexp(),
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local sn = ls.snippet_node
		local isn = ls.indent_snippet_node
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local c = ls.choice_node
		local d = ls.dynamic_node
		local r = ls.restore_node
		local events = require("luasnip.util.events")
		local ai = require("luasnip.nodes.absolute_indexer")
		local extras = require("luasnip.extras")
		local l = extras.lambda
		local rep = extras.rep
		local p = extras.partial
		local m = extras.match
		local n = extras.nonempty
		local dl = extras.dynamic_lambda
		local fmt = require("luasnip.extras.fmt").fmt
		local fmta = require("luasnip.extras.fmt").fmta
		local conds = require("luasnip.extras.expand_conditions")
		local postfix = require("luasnip.extras.postfix").postfix
		local types = require("luasnip.util.types")
		local parse = require("luasnip.util.parser").parse_snippet
		local ms = ls.multi_snippet
		local k = require("luasnip.nodes.key_indexer").new_key
		local loaders = require("luasnip.loaders.from_lua")

		loaders.lazy_load({ paths = { "~/.config/nvim/lua/mpbsd/snip" } })

		ls.snip_env = {
			ls = ls,
			s = s,
			sn = sn,
			isn = isn,
			t = t,
			i = i,
			f = f,
			c = c,
			d = d,
			r = r,
			events = events,
			ai = ai,
			extras = extras,
			l = l,
			rep = rep,
			p = p,
			m = m,
			n = n,
			dl = dl,
			fmt = fmt,
			fmta = fmta,
			conds = conds,
			postfix = postfix,
			types = types,
			parse = parse,
			ms = ms,
			k = k,
		}

		vim.keymap.set("n", "<LocalLeader>es", function()
			require("luasnip.loaders").edit_snippet_files()
		end, { noremap = true, silent = true })
	end,
}
