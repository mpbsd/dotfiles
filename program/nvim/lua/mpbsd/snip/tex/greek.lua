local utils = require("mpbsd.core.glb").utils

return {
	s({
		trig = "`([abgdezhjiklmnxprstufcyw]|[GDJLXPSUFYW]|v[ejpsrf])",
		regTrig = true,
		trigEngine = "ecma",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "greek letters",
	}, f(utils.greek_letter), { condition = utils.in_math }),
}
